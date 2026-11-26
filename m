Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709302;
	b=XisVaZZ85oZg38I24I4C4306tuhnLMbRaagvsqW8UdjB3L62JaNdL07TI9cRpqnDkVWx
	 ObX4eeO+EzWNL25m2WdMR312cDIg+v0H72uahAjq9BXVD2gJ8K4wpz4Vtzy3TDp9hbWWb
	 ahB68/ZdWYLFaNrxOisAfgRreDWb2y9U6sj8AwrdXKUJH4nVsrHEFqr1udHK3IGminsem
	 JY913bgQgg8wvcIHad0c7ohEPGt9j5Ft8I5q5OByDMiXoPUbGa9b7RnnGxF62Jfw3X2ly
	 nGAVuT6+S+OfgyMRzt+9PGdnSw9ARwH03bqumI9+qA7sB2HEPeUxmpN36dvvUD2p8mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709302;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:X-Change-ID:X-Mailer:
	 Content-Transfer-Encoding;
	bh=td/GitN5TIMWBj90hW05jZGOy4Zav0wRnXh5nDfe5js=;
	b=EJkp/fpQebBYyKPVPBIZa7X88FqOsAAv1IIDaOhHyGJ7048r2pf4jtJ2QZ2Slttuoni3
	 VVR1pJiavHF1RHhiqd0dv+EX9QElBICWPTRSLjzHqZM0L4F1kWpeSMx1TGZcIPqORD8RN
	 DDcGSTLONNdNBIzL1ywfVJEvMx3U/UNCLWENwaDSQ2cAIJwTvIGCMlS4IqMKC+Pdi8ohE
	 0OQzo/t8s628479arJFns/4zPt3K0InSnF3U39fnGrTdqXWlwuMgTP8W52DYmVyPjIAQ6
	 AcwgKsQIge4Wd7LRX9Wp5Xbz25IQzfMDNbndmMOD2IS1xxmQye1ANgpau0siNGfk29Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QXSHlLwa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEB1606A31C;
	Thu, 26 Nov 2026 16:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QXSHlLwa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 374A11F000C0;
	Thu, 26 Nov 2026 16:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795709301;
	bh=td/GitN5TIMWBj90hW05jZGOy4Zav0wRnXh5nDfe5js=;
	h=From:To:Cc:Subject:Date;
	b=QXSHlLwaN0P/2uZf1V0XLzbR3LWbeUOjSRNZXDNnk3smwZf+1qI4RmwTA5ACEg3X7
	 er4LN6J5li3sFNzcEfI9irQOS0W7ZtaSrbygm/wu9sOdYrGjJaODU29+XmlyG86BQD
	 tb7Kvmp8kC8E4KGq0v6YCca7HXcn3rwJF7Wz1mf2Tk2zci+0375hRExPQOi7oqTxZ9
	 JI4+B8umohoz4Yir3jxWS1YK60nxPkqlI6veoanwUwFR/4Vp2erYfywcvF3a2U1JBx
	 Fp+punq1hZ+VbCs8P/JZQc9m/kjS8w9MYnxeORgCIyS3ANkmY0JdS90sK7fOpVELEt
	 9Gbow6knivxiw==
From: Leon Romanovsky <leon@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: workflows@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2] docs: submitting-patches: Remove the trimmed backtrace example
Date: Thu, 26 Nov 2026 18:08:15 +0200
Message-ID: <20261126-backtrace-timestamps-v2-1-7bae8dce162c@nvidia.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20261125-backtrace-timestamps-29880a2f1cab
X-Mailer: b4 0.15-dev-18f8f
Content-Transfer-Encoding: 8bit

From: Leon Romanovsky <leonro@nvidia.com>

The backtrace example lists bare function names in its call trace,
without offsets or module names, and has no taint flags or module list.
AI tools copy that format, which hides that an out-of-tree module was
involved or that an in-kernel API was misused, especially a driver API
that is not meant for general use.

Remove the example and keep the guidance text.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
Changes in v2:
- Keep the section text and remove only the example.
- Link to v1: https://patch.msgid.link/20261126-backtrace-timestamps-v1-1-0a645b25e5ae@kernel.org
---
 Documentation/process/submitting-patches.rst | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 85ba046d66fbf..50e47b3861c18 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -771,14 +771,7 @@ stack dumps.
 
 Therefore, the most useful backtraces should distill the relevant
 information from the dump, which makes it easier to focus on the real
-issue. Here is an example of a well-trimmed backtrace::
-
-  unchecked MSR access error: WRMSR to 0xd51 (tried to write 0x0000000000000064)
-  at rIP: 0xffffffffae059994 (native_write_msr+0x4/0x20)
-  Call Trace:
-  mba_wrmsr
-  update_domains
-  rdtgroup_mkdir
+issue.
 
 Commentary
 ^^^^^^^^^^

---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261125-backtrace-timestamps-29880a2f1cab

Best regards,
--  
Leon Romanovsky <leonro@nvidia.com>

