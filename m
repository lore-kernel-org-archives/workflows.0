Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795260781;
	b=apbXqyqDeZzjNBFgwK4HLly2Mt6CKXZ5X4tR9nJM3QfSbVs/IsTmAEelczIZoo+oTV4P
	 msNxan5CHVL+BrvrQq81JV1SWioc12oWfRP0Ny2i24W3ZuP2tc+XI+k9S9mfOCmh6thdq
	 S0EhC1TUiOvInrlY03s2gcHLM/SvAuaIumyhLfWP2k+IPZyQpYgtmiGa6uS5Nm/i3UakZ
	 rETuxy0t+P5gBGHcl/9IypEuHAPW+VdOtvRanfDGUs0JT6/n+Zqee2Vq3D5B8ABDzy6wu
	 ylbDlFv/b9EUsfcmKeiXlL+f1w9kEUaK77Wr2oJzIGr+k/d7gshHv0XiaDZrrXR/g9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795260781;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-MBO-RS-ID:X-MBO-RS-META;
	bh=OarbdWsksfiuMbaIbktAxhgdo23HxzOkVP045lkqcyY=;
	b=fRDcZZeTfI4vfVWvhEYewA23gwhDcyIEelwahrgn2Y+HELxuDtsgLa2tJKFdm7jEYUq8
	 sZalLyvz/Ol6w2bu9V8h81Xfy1I2uuBIc6i1AGED/CME8uFIUaWPCOijlIc4MVLyCAEVF
	 gb+p0z6dwAb6jvsrw+wPYaB+Srsy9xe+F+WZG6/5ehLzvMDhtdLxtsyc0Hq2OGNNFd3nH
	 QCbmsJzk8conpWMf4O55RuHRyMf+34d5VbE7uh6Tl/8MeaEtbybFr5b9tOK3uyIrL2nDP
	 dqmBREAhxlpkV2muryiRv65bDbBZocT0+6iCcF2z3dsTDhDrkpSCN88ArLAFmIAGOMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=aEk+di5R;
	arc=none smtp.remote-ip=80.241.56.151
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F347606A325;
	Sat, 21 Nov 2026 11:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F347606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=aEk+di5R
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4jWqnj0j15z8vTn;
	Sat, 21 Nov 2026 12:32:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1795260777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OarbdWsksfiuMbaIbktAxhgdo23HxzOkVP045lkqcyY=;
	b=aEk+di5R+zMQLIgaCqbX5xSP75U/wUaKNG/lgo5wLryZ7t0K8iw7KSsxNKaXQ2X0kTBAi3
	GhrKP+uiarERyjjZnYO97kjcZF21AMFHofCq93/l2WfECUA3y2T4/AUcajQMJg3zxR7YoB
	gKVDTb2WFQLQ9ztNjye7K6PcDx+Sw/japTcwm7smdCRB4Ii+ZSab4z7B/zVOTfVdfVz/Qt
	epM650fAuqxR8CMOPhDSqPq2rmnSI+oHC1S/Cb0m6sLx9TivKI7KkLvVl7jGanrVfgT3hQ
	N2jvlO3nEjyAtlnjdl4KMU4mQT9pfQgNV6Vekme8yFn/irW+3/4+EFjFSCfm4A==
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Docs/process/changes: add comment refering to ver_linux
Date: Sat, 21 Nov 2026 12:32:21 +0100
Message-ID: <20261121113221.1442278-2-manuelebnerli@mailbox.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: c6be58729ddd3357dfd
X-MBO-RS-META: 3gdg4195k4jzxr44o78bw7czucug7pit

Add comment to keep ver_linux up to date. This comment does not show up
in the output of sphinx.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
 Documentation/process/changes.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 0aa232b117b..769557d03d9 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -27,6 +27,10 @@ running a Linux kernel.  Also, not all tools are necessary on all
 systems; obviously, if you don't have any PC Card hardware, for example,
 you probably do not need to concern yourself with pcmciautils.
 
+..
+   When changing anything in the following table, make shure to update
+   scripts/ver_linux aswell
+
 ====================== ===============  ========================================
         Program        Minimal version       Command to check the version
 ====================== ===============  ========================================
-- 
2.54.0

