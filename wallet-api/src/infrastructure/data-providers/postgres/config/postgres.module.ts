// Framework
import { Module } from '@nestjs/common';
import { TypeOrmModule, TypeOrmModuleOptions } from '@nestjs/typeorm';

// Infrastructure
import { EnvironmentModule, EnvironmentService } from 'src/infrastructure';

export const getPostgresModuleOptions = (
  config: EnvironmentService,
): TypeOrmModuleOptions => {
  return {
    type: config.getDatabaseDriver(),
    host: config.getDatabaseHost(),
    port: config.getDatabasePort(),
    password: config.getDatabasePassword(),
    username: config.getDatabaseUser(),
    database: config.getDatabaseName(),
    synchronize: true,
    autoLoadEntities: true,
  } as TypeOrmModuleOptions;
};

@Module({
  imports: [
    TypeOrmModule.forRootAsync({
      imports: [EnvironmentModule],
      inject: [EnvironmentService],
      useFactory: getPostgresModuleOptions,
    }),
  ],
  exports: [TypeOrmModule],
})
export class PostgresConfigModule {}
