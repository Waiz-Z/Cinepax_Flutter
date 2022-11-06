import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../providers/seats_state_provider.dart';

class ShowSeatingArrangement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final seatsStateProvider =
        Provider.of<SeatsStateProvider>(context, listen: false);
    return Container(
      height: 40.h,
      padding: const EdgeInsets.only(left: 0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
              5,
              (indexOfX) => Row(
                children: [
                  const SizedBox(width: 20),
                  for (int i = 1 + indexOfX * (10); i < 11 + indexOfX * 10; i++)
                    GestureDetector(
                      onTap: () {
                        seatsStateProvider.getBookedSeats.contains(i)
                            ? null
                            : seatsStateProvider.getSelectedSeats.contains(i)
                                ? seatsStateProvider.unSelectSeat(i)
                                : seatsStateProvider.selectSeat(i);
                      },
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Text((i).toString()),
                          Consumer<SeatsStateProvider>(
                              builder: (context, provider, _) {
                            return Image.asset(
                              provider.getBookedSeats.contains(i)
                                  ? 'assets/images/booked_seat.png'
                                  : provider.getSelectedSeats.isEmpty
                                      ? 'assets/images/unbooked_seat.png'
                                      : provider.getSelectedSeats.contains(i)
                                          ? 'assets/images/selected_seat.png'
                                          : 'assets/images/unbooked_seat.png',
                              width: 80,
                              height: 50,
                            );
                          }),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
