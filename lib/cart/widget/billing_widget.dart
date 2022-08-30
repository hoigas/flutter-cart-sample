import 'package:cart_sample/util/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BillingWidget extends StatelessWidget {
  const BillingWidget(
    this._totalPrice,
    this._deliveryPrice, {
    Key? key,
  }) : super(key: key);

  final String _totalPrice;
  final String _deliveryPrice;

  @override
  Widget build(BuildContext context) {
    final count = Provider.of<int>(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey.withOpacity(0.3), width: 2),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text('총 주문금액'),
                Spacer(),
                Text('${NumberUtil.formatByDefaultCurrency(_totalPriceByCount(count))}원'),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  '배탈팁',
                  style: TextStyle(fontSize: 16),
                ),
                Spacer(),
                Text(
                  '${NumberUtil.formatByDefaultCurrency(_deliveryPrice)}원',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Divider(color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  '결제예정금액',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  '${NumberUtil.formatByDefaultCurrency(_calculateToBePaidPrice(count))}원',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  String _totalPriceByCount(int count) {
    return '${int.parse(_totalPrice) * count}';
  }

  String _calculateToBePaidPrice(int count) {
    return '${int.parse(_totalPrice) * count + int.parse(_deliveryPrice)}';
  }
}
