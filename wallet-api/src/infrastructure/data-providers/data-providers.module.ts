// Framework
import { Module } from '@nestjs/common';

// Infrastructure
import { PostgresDataProviderModule } from './postgres';

// Replace or add with any other data provider module
@Module({
  imports: [PostgresDataProviderModule],
  exports: [PostgresDataProviderModule],
})
export class DataProvidersModule {}
