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

  async findAll(): Promise<Account[]> {
    return await this.accountsRepository.find();
  }
  async find(id: string): Promise<Account> {
    return await this.accountsRepository.findOneBy({ _id: id });
  }
  async create(item: Account): Promise<Account> {
    return await this.accountsRepository.create(item);
  }
  async update(id: string, item: Partial<Account>) {
    return this.accountsRepository.update(id, item);
  }
}
