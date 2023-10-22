// Framework
import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';

// Domain
import { IAccountRepository, IUserRepository } from 'src/domain/';

// Infrastructure
import { PostgresConfigModule } from './config';
import { PostgresAccount, PostgresUser } from './models';
import { PostgresAccountRepository, PostgresUserRepository } from './repositories';

@Module({
  imports: [
    PostgresConfigModule,
    TypeOrmModule.forFeature([PostgresUser]),
    TypeOrmModule.forFeature([PostgresAccount]),
  ],
  providers: [
    {
      provide: IUserRepository,
      useClass: PostgresUserRepository,
    },
    {
      provide: IAccountRepository,
      useClass: PostgresAccountRepository,
    },
  ],
  exports: [IUserRepository, IAccountRepository],
})
export class PostgresDataProviderModule {}
