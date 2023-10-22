// Framework
import { Module } from '@nestjs/common';

// Infrastructure
import { DataProvidersModule } from 'src/infrastructure';

// Presentation
import { AccountsService } from './accounts.service';
import { AccountsController } from './accounts.controller';
import { AccountsUseCases } from './use-cases';

@Module({
  controllers: [AccountsController],
  providers: [AccountsUseCases, AccountsService],
  imports: [DataProvidersModule],
})
export class AccountsModule {}
