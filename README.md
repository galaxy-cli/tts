# tts

A simple and lightweight **Text-to-Speech (TTS) utility** using [Festival](http://festival.org.uk/) and optional GPT integration via [tgpt](https://github.com/aandrew-me/tgpt).

---

## Features

- Converts text to speech using Festival TTS engine
- Supports multiple input sources:
  - Clipboard (`--clip`)
  - Text file (`--file FILE`)
  - Direct typed text (`--text`)
  - Output from `tgpt` command (`--tgpt`)
- Adjustable speech speed using Festival's `Duration_Stretch` parameter (`--speed NUM`)
- Automatic dependency check with optional installation prompt (Debian-based systems)
- Simple command-line interface with help output

---

## Dependencies

- [`festival`](http://festival.org.uk/)
- [`xsel`](https://github.com/kfish/xsel) (for clipboard access)
- [`git`](https://git-scm.com/) (for cloning tgpt)
- [`tgpt`](https://github.com/aandrew-me/tgpt) (optional, installed automatically if missing)

The script checks for these dependencies on launch and offers to install missing components automatically if run on a Debian-based system with `apt`.

Manual install commands for Debian/Ubuntu:

```
sudo apt update
sudo apt install festival xsel git
git clone https://github.com/aandrew-me/tgpt.git
sh tgpt/install
```

---

## Usage

`tts [FLAGS] [text]`

### Flags

| Flag          | Description                                                                                         |
| ------------- | --------------------------------------------------------------------------------------------------|
| `--clip`      | Use clipboard content as input                                                                     |
| `--file FILE` | Use the content of a text file as input                                                           |
| `--text`      | Read typed text input interactively                                                                |
| `--tgpt`      | Use output from the `tgpt` command                                                                 |
| `--speed NUM` | Set speech speed (`Duration_Stretch` parameter for Festival). `0.5` = faster, `1.5` = slower       |
| `--help`      | Show this help message                                                                              |

### Examples

- Speak clipboard content at default speed:

`tts --clip`

- Speak text from a file with slower speech (speed 1.2):

`tts --file /path/to/file.txt --speed 1.2`

- Speak output from tgpt at faster speed (speed 0.8):

`tts --tgpt --speed 0.8`

- Speak typed text directly:

`tts --text`

- Speak custom text passed as arguments:

`tts "Hello, this is a test"`

---

## How It Works

1. The script checks for required dependencies and prompts to install anything missing.
2. Input text is collected from one of the specified sources (`--clip`, `--file`, `--tgpt`, or direct input).
3. The text is optionally sent to Festival with a custom speech speed if specified.
4. Festival generates speech audio and plays it immediately.

---

## Notes

- The `--speed` flag adjusts Festival’s speech rate using the `Duration_Stretch` parameter:
- Values less than 1 produce faster speech.
- Values greater than 1 produce slower speech.
- For clipboard input, make sure text is copied to the system clipboard accessible by `xsel`.
- The GPT integration (`tgpt`) requires installing the [tgpt project](https://github.com/aandrew-me/tgpt) and having it set up.

---

## License

This project is licensed under the MIT License. See the LICENSE file for details.

---

## Author & Contact

**galaxy-cli**

GitHub: [https://github.com/galaxy-cli/tts](https://github.com/galaxy-cli/tts)
