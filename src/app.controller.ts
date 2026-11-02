import { Controller, Get, Query } from '@nestjs/common';
import { AppService } from './app.service.js';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  getHello(): string {
    return this.appService.getHello();
  }

  @Get('trade-transactions')
  getTradeTransactions(@Query('customer_id') customerId?: string) {
    return this.appService.getTradeTransactions(customerId);
  }
}
