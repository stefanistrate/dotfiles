from __future__ import annotations

import plistlib
from pathlib import Path

APP_DIR = "/Applications"


def list_all_apps() -> list[Path]:
    app_paths = []
    for path in Path(APP_DIR).glob("*"):
        if path.name.endswith(".app"):
            app_paths.append(path)
        elif path.is_dir():
            for child_path in path.glob("*.app"):
                app_paths.append(child_path)
    return sorted(app_paths)


def get_app_version(app_path: Path) -> str | None:
    info_path = app_path / "Contents/Info.plist"
    if not info_path.exists() or not info_path.is_file():
        return None
    with open(info_path, "rb") as fp:
        plist = plistlib.load(fp)
        return plist.get("CFBundleShortVersionString")


def main():
    for app in list_all_apps():
        version = get_app_version(app)
        if version:
            print(app, version, sep="\t")
        else:
            print(app)


if __name__ == "__main__":
    main()
