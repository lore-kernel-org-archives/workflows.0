Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042CA3D564D;
	Wed, 15 Apr 2026 08:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776243150; cv=none; b=Fy6f6b0IO97t950DWtJ+i7DSJLND+iEuF57y9/64JVpeFRlkEkF5JwDVTFCj9qhc1gJ2r8kzf6/bhCa636Reon5//f3KaM5qytTWP658b8PYcxltZjzKIwTSiMFMpKdBdFGaBqGDoi0/56VX6BIRaBxbzHHfh9gmNGosvLKi/fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776243150; c=relaxed/simple;
	bh=BpJ6sywaSZVQxAguZ1xiEWvvUTov0XqlViROQ62XlmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ONzAbksbR/j+UNIwUbF9/E69r49fjarL066G0qcpFC2MobEDeo2enU5YBOQro+AorAf91A8HC42QJa1BUvfjWh8c+Hj+6AnDq3dgSKpQEhYwcY23uHQfPEaqKhZog8wrUuyJP2RNoSxC3EoCAeE/PT9RNGlSibeWTRE8P2S+FPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pD8YoUIE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pD8YoUIE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A0E2C2BCC4;
	Wed, 15 Apr 2026 08:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776243149;
	bh=BpJ6sywaSZVQxAguZ1xiEWvvUTov0XqlViROQ62XlmA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pD8YoUIEeZlpv+BUN3U43jU7RwQz/yR1thghUAtOOv1qVRh7hcvU72imI4He9op9/
	 Un7hmhHF4gtZ29EoDdpm9YZ/Qm7tPyf8rFnnuMwypScYvfWY6ZuoccBwwdonuUwtj7
	 tBMNxrKGMQtkkNypzlvJNMhxPpGVBKNY23n5Ojayfg1jWNY1L6rOG/CLFploDPBVTJ
	 d7P46opgJ7/+dCAeF40avHu+Om+Y8wByIblVKhGtDH1FpWoiTeP9RGFf4ea//afUhn
	 egjLngmgrHMmjF/hZge/eXQfH/gRnVtH0aCypxysarRWBljNcULs4RV5LiLsO4Pc4Q
	 fmTk5ZSkdfp0A==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wCvz1-0000000ELwI-36Qq;
	Wed, 15 Apr 2026 10:52:27 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Dan Williams <djbw@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 8/8] docs: maintainers_include: Only show main entry for profiles
Date: Wed, 15 Apr 2026 10:52:24 +0200
Message-ID: <95936b751847f695d3d44eebbc996ae26010942c.1776242739.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1776242739.git.mchehab+huawei@kernel.org>
References: <cover.1776242739.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Instead of showing as a "Contents:" with 2 identation levels,
drop its title and show profiles as a list of entries.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/process/maintainer-handbooks.rst | 2 --
 Documentation/sphinx/maintainers_include.py    | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/process/maintainer-handbooks.rst b/Documentation/process/maintainer-handbooks.rst
index 531985a0fae8..3821e78aefc0 100644
--- a/Documentation/process/maintainer-handbooks.rst
+++ b/Documentation/process/maintainer-handbooks.rst
@@ -16,6 +16,4 @@ For maintainers, consider documenting additional requirements and
 expectations if submissions routinely overlook specific submission
 criteria. See Documentation/maintainer/maintainer-entry-profile.rst.
 
-Contents:
-
 .. maintainers-profile-toc::
diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index 948746b998a3..7ab921820612 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -235,7 +235,7 @@ class MaintainersProfile(Include):
         maint = MaintainersParser(base_path, path)
 
         output  = ".. toctree::\n"
-        output += "   :maxdepth: 2\n\n"
+        output += "   :maxdepth: 1\n\n"
 
         items = sorted(maint.profiles.items(),
                        key=lambda kv: (kv[1] or "", kv[0]))
-- 
2.53.0

