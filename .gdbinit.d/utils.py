import gdb


class UtilsStack(gdb.Command):
    """Show a stack like address:

Usage: stack [EXP [LENGTH]]
"""

    def __init__(self):
        super().__init__('stack', gdb.COMMAND_STACK)

    def invoke(self, argument, from_tty):
        args = gdb.string_to_argv(argument)
        sp = gdb.parse_and_eval(
            args.pop(0)) if args else gdb.selected_frame().read_register('sp')
        length = int(gdb.parse_and_eval(args.pop(0))) if args else 10
        long_type_ptr = gdb.lookup_type('long').pointer()
        sp = sp.cast(long_type_ptr)

        gdb.write(f'sp: {sp.format_string(styling=True)}\n')

        for a in range(length - 1, -1, -1):
            value = (sp + a).dereference().cast(long_type_ptr)
            gdb.write(f'sp+{4*a:3d}: {value.format_string(styling=True)}\n')


UtilsStack()
