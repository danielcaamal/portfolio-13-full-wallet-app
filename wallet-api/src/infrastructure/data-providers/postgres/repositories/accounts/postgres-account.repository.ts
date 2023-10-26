// Framework
import { InjectRepository } from '@nestjs/typeorm';

// External
import { Repository } from 'typeorm';

// Domain
import { IAccountRepository, Account } from 'src/domain';

// Infrastructure
import { PostgresAccount } from '../../models';

export class PostgresAccountRepository implements IAccountRepository {
  constructor(
    @InjectRepository(PostgresAccount)
    private readonly accountsRepository: Repository<Account>,
  ) {}
  async getTotalBalanceByUser(user: string): Promise<number> {
    const result = await this.accountsRepository
      .createQueryBuilder('account')
      .where('account.user = :user AND account.includeInBalance = TRUE', {
        user,
      })
      .select('SUM(account.amount)', 'total')
      .getRawOne();
    return result?.total || 0;
  }

  async findAll(): Promise<Account[]> {
    return await this.accountsRepository.find({
      relations: ['user'],
    });
  }

  async find(id: string): Promise<Account> {
    return await this.accountsRepository.findOneBy({
      _id: id,
    });
  }

  async findOneByUser(id: string, user: string): Promise<Account> {
    return await this.accountsRepository.findOneBy({
      _id: id,
      user: {
        _id: user,
      },
    });
  }

  async create(item: Account): Promise<Account> {
    return await this.accountsRepository.save(item);
  }

  async update(id: string, item: Partial<Account>) {
    return this.accountsRepository.update(id, item);
  }

  async findAllByUser(user: string): Promise<Account[]> {
    return await this.accountsRepository.find({
      where: {
        user: {
          _id: user,
        },
      },
      relations: ['user'],
    });
  }
}
