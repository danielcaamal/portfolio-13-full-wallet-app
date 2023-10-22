// Framework
import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';

// Domain
import { IUserRepository } from 'src/domain/';

// Infrastructure
import { PostgresConfigModule } from './config';
import { PostgresUser } from './models';
import { PostgresUserRepository } from './repositories';

@Module({
  imports: [PostgresConfigModule, TypeOrmModule.forFeature([PostgresUser])],
  providers: [
    {
      provide: IUserRepository,
      useClass: PostgresUserRepository,
    },
  ],
  exports: [IUserRepository],
})
export class PostgresDataProviderModule {}
