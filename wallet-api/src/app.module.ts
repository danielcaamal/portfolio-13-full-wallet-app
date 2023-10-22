// Framework
import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';

// Infrastructure
import {
  DataProvidersModule,
  EnvironmentModule,
  ExceptionsModule,
  LoggerModule,
} from './infrastructure';

// Presentation
import { AccountsModule, UsersModule } from './presentation';

@Module({
  imports: [
    ConfigModule.forRoot({
      envFilePath: '.env',
      isGlobal: true,
    }),
    EnvironmentModule,
    LoggerModule,
    ExceptionsModule,
    DataProvidersModule,
    UsersModule,
    AccountsModule,
  ],
  controllers: [],
  providers: [],
})
export class AppModule {}
