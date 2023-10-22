// Framework
import { Module } from '@nestjs/common';

// Infrastructure
import { DataProvidersModule } from 'src/infrastructure';

// Presentation
import { UsersService } from './users.service';
import { UsersController } from './users.controller';
import { AuthUseCases, UsersUseCases } from './use-cases';
import { HashService } from './hash.service';

@Module({
  controllers: [UsersController],
  providers: [UsersUseCases, AuthUseCases, UsersService, HashService],
  imports: [DataProvidersModule],
})
export class UsersModule {}
