// Framework
import { Module } from '@nestjs/common';

// Infrastructure
import { DataProvidersModule } from 'src/infrastructure';

// Presentation
import { UsersService } from './users.service';
import { UsersController } from './users.controller';
import { UsersUseCases } from './use-cases';

@Module({
  controllers: [UsersController],
  providers: [UsersUseCases, UsersService],
  imports: [DataProvidersModule],
})
export class UsersModule {}
