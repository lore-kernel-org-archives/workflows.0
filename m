Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB7B1DEFE3;
	Wed, 29 Jan 2025 16:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738167000; cv=none; b=nbaecTZQ0aId2wgb2rZL5oYYGOkS4b5834K+gRoNTQ9STatcCttUBRYZ4kPUo5kTv3rZZ5Bh+INPJz1igWe8/Kn8o+DQsJ3DAPGbqqMU7GbQdvmvLWZm3EzKZgsSSx06za/cHF3gmY1nAtlD4am+OoCsYXA8Q0Yl5nx9PcuKrvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738167000; c=relaxed/simple;
	bh=srHijyQOosizcjglctE3PuWbAhpV+PjxpF0lhRZID9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WeLAV9XWoLuT2nTtAB1zA4pD+vXILnZne8Ee1upRvjSMrBNaxolXpfvWgnakH98kpNqCtimeHGKzdOyqedPi4vZmIiIqLGBPShh5rQA/VTtVBlbCZzaSeyxMTojmgWKz/XH3GMjcUUvyOSYvQF9QDzcAB5/PTAj1gro+42yH8Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JpXDgiA+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JpXDgiA+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C2D0C4AF0B;
	Wed, 29 Jan 2025 16:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738166999;
	bh=srHijyQOosizcjglctE3PuWbAhpV+PjxpF0lhRZID9Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JpXDgiA+T8LR2BKVRZW2oMMY4WtYjN76lw64PNv5n4QmvKlV7HLwsRdHfJCDGJQKc
	 0NGi5dBMFcXpvCVwekXycs/FhSiW6/f47N6ucXjcrIBdWPr6kYEtxO5vwzTWMIld5W
	 E3GiX5NTuiE1wPKDbd1K9HNNnCTRK3le7C/J54WEN6YrnnH4wCkc6YCStA1SmLWsPR
	 LTqo8KbADxOipWMdIB98i5R6etlzvSKTLesDZN2fs846lAQRZRkeFey8SUuEbISiDe
	 CdxBt6huuwAlvqqrQU6NVLiWFXNtAjqAWHr4L4M7yIM6AOIjEw0bn/CCWYkZ/+SIOX
	 5m9q5Uc63s3DA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tdAdZ-00000004PEa-26En;
	Wed, 29 Jan 2025 17:09:57 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org
Subject: [RFC 5/6] docs: changes: update Sphinx minimal version to 3.4.3
Date: Wed, 29 Jan 2025 17:09:36 +0100
Message-ID: <0285c3815208649148b32b3842e1c18975ef5c71.1738166451.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738166451.git.mchehab+huawei@kernel.org>
References: <cover.1738166451.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Doing that allows us to get rid of all backward-compatible code.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/conf.py             | 2 +-
 Documentation/process/changes.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 0c2205d536b3..3dad1f90b098 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -47,7 +47,7 @@ from load_config import loadConfig
 # -- General configuration ------------------------------------------------
 
 # If your documentation needs a minimal Sphinx version, state it here.
-needs_sphinx = '2.4.4'
+needs_sphinx = '3.4.3'
 
 # Add any Sphinx extension module names here, as strings. They can be
 # extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 82b5e378eebf..012d2b715c2a 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -58,7 +58,7 @@ mcelog                 0.6              mcelog --version
 iptables               1.4.2            iptables -V
 openssl & libcrypto    1.0.0            openssl version
 bc                     1.06.95          bc --version
-Sphinx\ [#f1]_         2.4.4            sphinx-build --version
+Sphinx\ [#f1]_         3.4.3            sphinx-build --version
 cpio                   any              cpio --version
 GNU tar                1.28             tar --version
 gtags (optional)       6.6.5            gtags --version
-- 
2.48.1

