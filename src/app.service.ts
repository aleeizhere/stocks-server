import { Injectable } from '@nestjs/common';
import { PrismaService } from './prisma.service.js';

@Injectable()
export class AppService {
  constructor(private readonly prisma: PrismaService) {}

  getHello(): string {
    return 'Hello World!';
  }

  async getTradeTransactions(customerId?: string) {
    const transactions = await this.prisma.trade_transactions.findMany({
      where: customerId ? { customer_id: customerId } : undefined,
      orderBy: { created_at: 'desc' },
      take: 100,
    });

    // JSON cannot serialize JavaScript BigInt values directly.
    return transactions.map((transaction) => ({
      ...transaction,
      id: transaction.id.toString(),
    }));
  }
}
