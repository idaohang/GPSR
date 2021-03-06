//*******************************************************************************
//*  Copyright: National ICT Australia,  2007 - 2010                            *
//*  Developed at the ATP lab, Networked Systems research theme                 *
//*  Author(s): Athanassios Boulis, Dimosthenis Pediaditakis, Yuriy Tselishchev *
//*  This file is distributed under the terms in the attached LICENSE file.     *
//*  If you do not find this file, copies can be found by writing to:           *
//*                                                                             *
//*      NICTA, Locked Bag 9013, Alexandria, NSW 1435, Australia                *
//*      Attention:  License Inquiry.                                           *
//*                                                                             *  
//******************************************************************************/

package node.communication.mac.tunableMac;

// ================================================
// Default parameter values will result in simple 
// CSMA behavior (carrier sense then send)
// ================================================

simple TunableMAC like node.communication.mac.iMac {
 parameters: 
	bool collectTraceInfo = default (true);
	bool printStateTransitions = default (false);

	//=============== These are parameters which can be tuned ===================

	double dutyCycle = default (1.0);	// sleeping / (sleeping+listening)
	int listenInterval = default (10);	// how long do we leave the radio in listen mode, in ms
	double beaconIntervalFraction = default (1.0);	// fraction of the sleeping interval that we send beacons
	double probTx = default (1.0);		// the probability of a single try of Transmission to happen
	int numTx = default (1);			// when we have something to Tx, how many times we try
	int randomTxOffset = default (10);	// Tx after time chosen randomly from interval [0..randomTxOffset]
	int reTxInterval = default (0);		// Interval between retransmissions in ms, (numTx-1) retransmissions
	int backoffType = default (1);		// 0-->(backoff = sleepinterval), 
										// 1-->(backoff = constant value), 
										// 2-->(backoff = multiplying value - e.g. 1*a, 2*a, 3*a, 4*a ...), 
										// 3-->(backoff = exponential value - e.g. 2, 4, 8, 16, 32...)
	int backoffBaseValue = default (16);// the backoff base value in ms

	//=============== End of tunable parameters ===================================

	int macMaxPacketSize = default (0);
	int macPacketOverhead = default (9);
	int beaconFrameSize = default (14);
	int macBufferSize = default (32);

	bool carrierSense = default (true);	//if we want the MAC to perform carrier sense before sending to Radio

	double phyDataRate = default (250.0);
	double phyDelayForValidCS = default (0.128);
	int phyFrameOverhead = default (6);

 gates:
	output toNetworkModule;
	output toRadioModule;
	input fromNetworkModule;
	input fromRadioModule;
	input fromCommModuleResourceMgr;
}

