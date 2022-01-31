from typing import Any, Callable
from idom import html


def Input(
    value: Any,
    set_value: Callable,
    label: str = "",
    type: str = "text",
    placeholder: str = "Write here the",
    _class: str = """text-primary-500 placeholder-secondary-400 w-full px-4 py-2.5 mt-2 
                    text-base transition duration-500 ease-in-out transform 
                    border-transparent bg-secondary-300 focus:border-blueGray-500 
                    focus:bg-white dark:focus:bg-secondary-400 focus:outline-none 
                    focus:shadow-outline focus:ring-2 ring-offset-current ring-offset-2 
                    ring-gray-400""",
):

    return html.input(
        {
            "type": type,
            "placeholder": f"{placeholder} {label}",
            "value": value,
            "onChange": lambda event: set_value(event["target"]["value"]),
            "class": _class,
        }
    )
