Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DBD3D412D;
	Mon, 27 Apr 2026 14:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777299756; cv=none; b=lWq8poC8N1GQeov5Qy3bVaRiANfHL/WzgqyCFCKpa8FWkPJUiXR/j8ug8h2xWGhnh/03cU2C81eaGxDa/3FMFv491T9FKXMaBHMEMBjWvBIMDwxKhn0ppaxtXQjs2InEdK8UzDvL3r9kGst2ZZZhXybyb8AHTAOJUlNdu4rucbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777299756; c=relaxed/simple;
	bh=E3XaUZpwsbd6HDm3kWl1GEnwhRzHLxZQZYqA7/UzEm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZPEaF7MsEsg30uwdeo9D/5MUouP/o7uf42FvKFiIp8Myk0zriEW8lcNx4tZvwOsYHcoxvJYTTtn0gefH1+/mqDes8ipWUDT5uUC2+9EuVWr5+uHwN/99F8COCYCUEnAjaU0Fj5kYnWerQnHHGa/Mze0iSe6vwxZLKN9K/uMSt1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BOteI6RP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BOteI6RP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFB0AC2BCB9;
	Mon, 27 Apr 2026 14:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777299755;
	bh=E3XaUZpwsbd6HDm3kWl1GEnwhRzHLxZQZYqA7/UzEm8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BOteI6RP2hQ5Z8VatsZNOi56HYMeReNNnUeCHpMNypzzBRNowIuk5Q8afZX9a9PuO
	 inRDkHUDgcbnLqyqZtlcSfqh385oY7p8gL7HPeMKCAGXbLLsWW8Zrv/w9JTrUsMiFk
	 UtN4rbfUJtOKV3ntu63AfKhdrOURcxVTzkKyihzDFDLs1Jj36eJc3mwhwGM+zBYTfj
	 NFn4knlPTflKCWqQigA8KnTSurceJAf7JKMFLBeRkyavSHY3yjObIRgLyDa8dtHGFI
	 3/jp1tdUMpjiR+Dnq7mU1oflgRB8F1V1PCRsId/w5nF3dxYcCP2NWBXmUOOdrk+pTv
	 EY8vQwRsQ/bQQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wHMr4-0000000C8Ti-0aGO;
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
Subject: [PATCH v4 04/10] docs: maintainers_include: use a better title for profiles
Date: Mon, 27 Apr 2026 16:22:22 +0200
Message-ID: <8ce9c77c4d8c98e6bad37d838b0e359c8416040c.1777295258.git.mchehab+huawei@kernel.org>
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

As we're picking the name of the subsystem from MAINTAINERS,
also use its subsystem name for the titles.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index 1dac83bf1a65..cf428db7599c 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -36,7 +36,7 @@ class MaintainersParser:
     """Parse MAINTAINERS file(s) content"""
 
     def __init__(self, base_path, path):
-        self.profiles = list()
+        self.profiles = {}
 
         result = list()
         result.append(".. _maintainers:")
@@ -54,6 +54,7 @@ class MaintainersParser:
         prev = None
         field_prev = ""
         field_content = ""
+        subsystem_name = None
 
         for line in open(path):
             # Have we reached the end of the preformatted Descriptions text?
@@ -75,7 +76,10 @@ class MaintainersParser:
             if match:
                 fname = os.path.relpath(match.group(1), base_path)
                 if fname not in self.profiles:
-                    self.profiles.append(fname)
+                    if self.profiles.get(fname) is None:
+                        self.profiles[fname] = subsystem_name
+                    else:
+                        self.profiles[fname] += f", {subsystem_name}"
 
             # Linkify all non-wildcard refs to ReST files in Documentation/.
             pat = r'(Documentation/([^\s\?\*]*)\.rst)'
@@ -112,6 +116,8 @@ class MaintainersParser:
                     output = field_content + "\n\n"
                     field_content = ""
 
+                    subsystem_name = line.title()
+
                     # Collapse whitespace in subsystem name.
                     heading = re.sub(r"\s+", " ", line)
                     output = output + "%s\n%s" % (heading, "~" * len(heading))
@@ -217,7 +223,13 @@ class MaintainersProfile(Include):
 
         output  = ".. toctree::\n"
         output += "   :maxdepth: 2\n\n"
-        output += indent("\n".join(profiles), "   ")
+
+        items = sorted(profiles.items(), key=lambda kv: (kv[1] or "", kv[0]))
+        for fname, profile in items:
+            if profile:
+                output += f"   {profile} <{fname}>\n"
+            else:
+                output += f"   {fname}\n"
 
         self.state_machine.insert_input(statemachine.string2lines(output), path)
 
-- 
2.53.0

