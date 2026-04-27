Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66ACB3D47AA;
	Mon, 27 Apr 2026 14:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777299756; cv=none; b=YhzVKgCKCjBixtIMEXIBVSD8iWr8SbszNP+fw4xsFgAE7TbQ9FCbL3iHDxf1Uvdax1/bGRjrxMyFlEN3nZU/LwXoKOl2r2XqjQ5w+AKdhDpEkjgJM+GsE9iWAELo43Rw9fVujXu9vuqP8KBXXkNLLiILXVOss8zGG1dy+/n1AuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777299756; c=relaxed/simple;
	bh=0shH3sYNJw46ZXhUBb7ZZLmWnfDxlkyIXiYSyyLbk7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tVd4dwIAW/k6YlPrZT2EB6C9apmNIDzaZ2ZLbesLJNRo4GOI6jrwf/jhrx5MkAZs4N9ve1Doak+QjoSCYCbxqedAyUSUYVE5zUftAch8pWmb9yNxEWr8ZKAOJ5yCO1UbssYiISUAJfnBRpgzDShyJQgO48R9SzEghBblc2fOQF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KSup6Xk2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KSup6Xk2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C2F7C2BCC4;
	Mon, 27 Apr 2026 14:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777299756;
	bh=0shH3sYNJw46ZXhUBb7ZZLmWnfDxlkyIXiYSyyLbk7s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KSup6Xk26SVjls6PE/k9vVIVVI6u3N5Rk9SnIReyU1IeMSq1yASSm5JH8JzMfSlqO
	 Bnb/HSoN7iSgsLAIK3eQZSzuIvlsKEE/dHQAd/nU5ie5u11L7PnT6RIWs6oShHWK4M
	 q1s9Gyqyb4Yo9ID+9vf9tulnDQw1UzZHIMOzhwP4SNDUvdWF2hExZq/gDwdOF3igCv
	 Qijz1icL5PinDyMeY/0Sz2eaA8I0Z1EaB7dwUgMvG9RE4Y9zJ4RKxfL19S9VPNuooG
	 qX7SzXfh8uFw929UVLuiTvG5r0pDwxro5TKSt60bsHY7/oibd+WD6nq3h1gl+WLKzS
	 5GC075n3amDSg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wHMr4-0000000C8Uv-1Ixw;
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
Subject: [PATCH v4 05/10] docs: maintainers_include: add external profile URLs
Date: Mon, 27 Apr 2026 16:22:23 +0200
Message-ID: <b80639a38abdc934589e88bc9fc3029ad5c20bfe.1777295258.git.mchehab+huawei@kernel.org>
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

Some subsystem profiles are maintained elsewhere. Add them to
the output.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 28 +++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index cf428db7599c..f1b8d4b00c2a 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -37,6 +37,7 @@ class MaintainersParser:
 
     def __init__(self, base_path, path):
         self.profiles = {}
+        self.profile_urls = {}
 
         result = list()
         result.append(".. _maintainers:")
@@ -81,6 +82,16 @@ class MaintainersParser:
                     else:
                         self.profiles[fname] += f", {subsystem_name}"
 
+            match = re.match(r"P:\s*(https?://.*)", line)
+            if match:
+                url = match.group(1).strip()
+                if url not in self.profile_urls:
+                    if self.profile_urls.get(url) is None:
+                        self.profile_urls[url] = subsystem_name
+                    else:
+                        self.profile_urls[url] += f", {subsystem_name}"
+
+
             # Linkify all non-wildcard refs to ReST files in Documentation/.
             pat = r'(Documentation/([^\s\?\*]*)\.rst)'
             m = re.search(pat, line)
@@ -219,18 +230,31 @@ class MaintainersProfile(Include):
     def emit(self, base_path, path):
         """Parse all the MAINTAINERS lines looking for profile entries"""
 
-        profiles = MaintainersParser(base_path, path).profiles
+        maint = MaintainersParser(base_path, path)
 
         output  = ".. toctree::\n"
         output += "   :maxdepth: 2\n\n"
 
-        items = sorted(profiles.items(), key=lambda kv: (kv[1] or "", kv[0]))
+        items = sorted(maint.profiles.items(),
+                       key=lambda kv: (kv[1] or "", kv[0]))
         for fname, profile in items:
             if profile:
                 output += f"   {profile} <{fname}>\n"
             else:
                 output += f"   {fname}\n"
 
+        output += "\n**External profiles**\n\n"
+
+        items = sorted(maint.profile_urls.items(),
+                       key=lambda kv: (kv[1] or "", kv[0]))
+        for url, profile in items:
+            if profile:
+                output += f"- {profile} <{url}>\n"
+            else:
+                output += f"- {url}\n"
+
+        output += "\n"
+
         self.state_machine.insert_input(statemachine.string2lines(output), path)
 
     def run(self):
-- 
2.53.0

