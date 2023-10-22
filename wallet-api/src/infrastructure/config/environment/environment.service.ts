// Framework
import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';

// Domain
import { DatabaseConfig } from 'src/domain';

@Injectable()
export class EnvironmentService implements DatabaseConfig {
  constructor(private configService: ConfigService) {}

  getDatabaseHost(): string {
    return this.configService.getOrThrow<string>('DATABASE_HOST');
  }

  getDatabasePort(): number {
    return this.configService.getOrThrow<number>('DATABASE_PORT');
  }

  getDatabaseUser(): string {
    return this.configService.getOrThrow<string>('DATABASE_USER');
  }

  getDatabasePassword(): string {
    return this.configService.getOrThrow<string>('DATABASE_PASSWORD');
  }

  getDatabaseName(): string {
    return this.configService.getOrThrow<string>('DATABASE_NAME');
  }

  getDatabaseSchema(): string {
    return this.configService.getOrThrow<string>('DATABASE_SCHEMA');
  }

  getDatabaseSync(): boolean {
    return this.configService.getOrThrow<boolean>('DATABASE_SYNCHRONIZE');
  }

  getDatabaseDriver(): string {
    return this.configService.getOrThrow<string>('DATABASE_DRIVER');
  }
}
