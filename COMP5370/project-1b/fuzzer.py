"""
YOU MAY CHANGE THIS FILE IN ANY WAY YOU SEE FIT.
"""
import base64
import random
import argparse
import sys

from serialization import marshal
from deserialization import unmarshal
from exceptions import SerializationError, DeserializationError

def parse_cmd_args():
    # It is *highly suggested* you don't change this function but not forbidden.
    parser = argparse.ArgumentParser()
    parser.add_argument(
            '--count',
            type=int,
            required=True,
            dest='count',
            metavar='n',
            help='The number of inputs to generate and test.',
            )
    parser.add_argument(
            '--seed',
            type=str,
            required=True,
            dest='seed',
            metavar='seed_string',
            help='The seed to generate inputs from.',
            )
    args = parser.parse_args()
    return args.seed, args.count

def generate_really_bad_input():
    # TODO: Delete this function.
    return 'b' * random.randint(1, 10)

def main():
    seed, count = parse_cmd_args()
    random.seed(seed)

    all_inputs_handle = open(seed+'.inputs', 'w')
    error_inputs_handle = open(seed+'.failure', 'w')
    for i in range(count):
        # TODO: Make a significantly better fuzzer.

        ########################################################################
        # The below is not a safe template to implement your fuzzer from. There
        # are many known-issues and it does *NOT* meet the expectations from
        # the assignment. It is provided *ONLY* to have a working "something"
        # and a known-bad one at that.
        ########################################################################
        test_value = generate_really_bad_input()
        line_for_files = '{input:'+test_value+'s}\n'
        all_inputs_handle.write(line_for_files)
        did_error = False
        got = marshal({'a':test_value})
        if got != '{a:'+test_value+'s}':
            did_error = True
        got = unmarshal('{a:'+test_value+'s}')
        if got != {'a':test_value}:
            did_error = True
        if did_error:
            error_inputs_handle.write(line_for_files)

    all_inputs_handle.close()
    error_inputs_handle.close()
    sys.exit(0)

main()
