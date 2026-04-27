Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7C53D47DD;
	Mon, 27 Apr 2026 14:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777299756; cv=none; b=Tmyk1Em5J7DptZ7RzL5mvn67afJ7asGT0AaYjwfUDZH8W1UaCTPEx/b/bjKpUTznRXzFVFd8u271tdfnIRhg9WB+TCcG1yCTsGLtKmAVrDMTsT0Ms0T2Xq4RWPwrKFhWb72IHdhSNXk2FnGJ/xHPFY8V4U9CDqIC3cAt8REhOF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777299756; c=relaxed/simple;
	bh=I5vPs/IWujzOHVh7PrTDW0lngtg+Gz1odrK4JwsYFaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dGg2NRUHgM/ESi522WKIkD6hKxM16aTmCtpQf2QVdTC+Lg91ozoCCRjSGFiYn0nnubHHvHxAfYMEdqpLtwDRgaswyZwzCyT4FYRWv2+X9TjdaSMvCzSChXN2LTlAVLVRi9uHopD6SHUFQmcohs2nEKH8RUK05wGhUvfssUn4+3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zdi4fMzY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zdi4fMzY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D2C3C2BCB9;
	Mon, 27 Apr 2026 14:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777299756;
	bh=I5vPs/IWujzOHVh7PrTDW0lngtg+Gz1odrK4JwsYFaI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zdi4fMzYladiP2JQ9zuFLVErYm0Kl2UnOLXTgxZKuPk4xSkP0LcI3Ih064AWuLEkF
	 9uxKTzH+hknWIb2bPxZWx8q1ad4KvNpKQROAy4cdhoz4+8UQTtZgQKvxfuYbXmnNYC
	 4I4iS5nPSbCNoB4w3oGe7ngDOPTA75PoPAsCwJl0rQBEI0iCD6BhOpiRvOqNmKzovW
	 zc6hr/exBtFhJK1VAk839f5KE0EmZkCM8q/+NzIrc760m5PWivahr7h38tEVXzJfKn
	 8rtHfkpLpnP7nA4jo9QnFJnmS+L6udzUopaF6FKtmemgr69d6TuuZi7KGPvBQTIkQA
	 o6U6FifntJ3Xw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wHMr4-0000000C8Yb-3U8y;
	Mon, 27 Apr 2026 16:22:34 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v4 08/10] docs: maintainers_include: improve its output
Date: Mon, 27 Apr 2026 16:22:26 +0200
Message-ID: <10d06a3f530e07ad981aba93617a9a7f4d63c408.1777295258.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777295258.git.mchehab+huawei@kernel.org>
References: <cover.1777295258.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

There are three "types" of profiles:
1. Profiles already included inside subsystem-specific documentation.
   This is the most common case;
2. Profiles that are hosted externally;
3. Profiles that are at the same location as maintainer-handbooks.rst.

For (3), we need to create a TOC, as they don't exist elsewhere.

Change the logic to create TOC just for (3), prepending the
content of maintainer-handbooks with a sorted entry of all types,
before the TOC.

With such change, we can have an unique sorted list of profiles,
having the subsystem names used there listed.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 76 +++++++++++----------
 1 file changed, 40 insertions(+), 36 deletions(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index 7ab921820612..5413c1350bba 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -21,7 +21,7 @@ import sys
 import re
 import os.path
 
-from textwrap import indent
+from glob import glob
 
 from docutils import statemachine
 from docutils.parsers.rst import Directive
@@ -36,8 +36,8 @@ class MaintainersParser:
     """Parse MAINTAINERS file(s) content"""
 
     def __init__(self, base_path, path):
-        self.profiles = {}
-        self.profile_urls = {}
+        self.profile_toc = set()
+        self.profile_entries = {}
 
         result = list()
         result.append(".. _maintainers:")
@@ -73,26 +73,24 @@ class MaintainersParser:
             # Drop needless input whitespace.
             line = line.rstrip()
 
+            #
+            # Handle profile entries - either as files or as https refs
+            #
             match = re.match(r"P:\s*(Documentation/\S+)\.rst", line)
             if match:
-                fname = os.path.relpath(match.group(1), base_path)
-                if fname.startswith("../"):
-                    if self.profiles.get(fname) is None:
-                        self.profiles[fname] = subsystem_name
-                    else:
-                        self.profiles[fname] += f", {subsystem_name}"
+                entry = os.path.relpath(match.group(1), base_path)
+                if "*" in entry:
+                    for e in glob(entry):
+                        self.profile_toc.add(e)
+                        self.profile_entries[subsystem_name] = e
                 else:
-                    self.profiles[fname] = None
-
-            match = re.match(r"P:\s*(https?://.*)", line)
-            if match:
-                url = match.group(1).strip()
-                if url not in self.profile_urls:
-                    if self.profile_urls.get(url) is None:
-                        self.profile_urls[url] = subsystem_name
-                    else:
-                        self.profile_urls[url] += f", {subsystem_name}"
-
+                    self.profile_toc.add(entry)
+                    self.profile_entries[subsystem_name] = entry
+            else:
+                match = re.match(r"P:\s*(https?://.*)", line)
+                if match:
+                    entry = match.group(1).strip()
+                    self.profile_entries[subsystem_name] = entry
 
             # Linkify all non-wildcard refs to ReST files in Documentation/.
             pat = r'(Documentation/([^\s\?\*]*)\.rst)'
@@ -234,26 +232,32 @@ class MaintainersProfile(Include):
 
         maint = MaintainersParser(base_path, path)
 
-        output  = ".. toctree::\n"
-        output += "   :maxdepth: 1\n\n"
+        #
+        # Produce a list with all maintainer profiles, sorted by subsystem name
+        #
+        output = ""
 
-        items = sorted(maint.profiles.items(),
-                       key=lambda kv: (kv[1] or "", kv[0]))
-        for fname, profile in items:
-            if profile:
-                output += f"   {profile} <{fname}>\n"
+        for profile, entry in maint.profile_entries.items():
+            if entry.startswith("http"):
+                if profile:
+                    output += f"- `{profile} <{entry}>`_\n"
+                else:
+                    output += f"- `<{entry}>_`\n"
             else:
-                output += f"   {fname}\n"
+                if profile:
+                    output += f"- :doc:`{profile} <{entry}>`\n"
+                else:
+                    output += f"- :doc:`<{entry}>`\n"
 
-        output += "\n**External profiles**\n\n"
+        #
+        # Create a hidden TOC table with all profiles. That allows adding
+        # profiles without needing to add them on any index.rst file.
+        #
+        output += "\n.. toctree::\n"
+        output += "   :hidden:\n\n"
 
-        items = sorted(maint.profile_urls.items(),
-                       key=lambda kv: (kv[1] or "", kv[0]))
-        for url, profile in items:
-            if profile:
-                output += f"- {profile} <{url}>\n"
-            else:
-                output += f"- {url}\n"
+        for fname in maint.profile_toc:
+            output += f"   {fname}\n"
 
         output += "\n"
 
-- 
2.53.0

