Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795262002;
	b=t4eMeiiIQSFQ5y2q8wNbvIBH/wtkPielc8HoMRIMyLlOJiJfb9HpXBt5eKJt5xof4ZYo
	 0VGH3AFdJhsdQOOfL+UagvNVu5/zbI00rndBX5++PQvfhRQpVrUjTB9+5S/ddlDa2hJrx
	 l/d+eoMnvYGFSeBopFfwIApLoMeInNBdwbs5zWXD2q7HKwDO1ptx4//rEvcSdFOyvO3rI
	 wuERHzRfHAmNL4NLjXULvP0IXzHncBPy/RuBZQgkeFwAG8v0kW4TQhPOb7IjohsRXwTz3
	 I+WBd1tmWl6A+IgCD+2QJZFwZrfEIgugBVOxZT7UG5WAgwdNmE8imYd+kuJgRmTpsxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795262002;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-MBO-RS-META:X-MBO-RS-ID;
	bh=Y2SGzri+nFmiF4XaTK6A3wGQO9yshbm4+8RKCMSJ94I=;
	b=ZrzUFglsgSkzVbDmqT+84fyAfS+ke5tahSGR5Rr71yhmnrbS28VFqusIu8P9rj9v2TqJ
	 yxdXkFCbZtzJgrgechcMmsWxS1tLRD7laKFpOw/Hu2cL7SX4W4BblQ56/vylPtA7kse09
	 6/krkp8esb0tUcN/sIYbfTSrEDb5WR0tiuc6vERRmbMAt82c3VdkVdo7KGlt8zsg2Hmp2
	 pzg7zooQJs6fY1nRTcQlf4zsYxoWIcbnEA6HtZLrb+v/Owko4oMUHN9y/uK6LmbyOSrsR
	 nWUxX4Vxg1EEADn+isGqblAwD1HIEO6l5SR6Ufitt6LbbD7RbSE2HzE324+ipJX+U6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=IsTcmFr1;
	arc=none smtp.remote-ip=80.241.56.152
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097A1606A325;
	Sat, 21 Nov 2026 11:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 097A1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=IsTcmFr1
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4jWrF85rm5zKnDY;
	Sat, 21 Nov 2026 12:53:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1795261996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y2SGzri+nFmiF4XaTK6A3wGQO9yshbm4+8RKCMSJ94I=;
	b=IsTcmFr1A52fr3CSDt28Xz4iWASt+Ac5BQBo69UwNQ/bNpvYFHJMNAcW7ymtGJWlhTIgDM
	rhoi0rAAWVRpEmaq7gZNpHR6Zp0MctkZ89+o8Htd4I636yMAbohMWq04+H4NTh5Xu1Vqsg
	Dw3ehNZZWcKArMGoL7GcIsvHLtRF1nuQgQ/6ZD2vR6bW+wsUXVKZPo9t22AoLpe58N38zz
	1YdC1bbg9L3gQuD9/REw9m9jLtRUV1Ew7X3s91zg84QOPKSfOPaRm/+OSEIrKcaa3TMQr7
	3sYV86dZUA+lNXsIgRFyYjLbcSN4Bsqg81sYecKmkKMvOfcKCWQp2QLQsivrHA==
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] Docs/process/changes: add comment referring to ver_linux
Date: Sat, 21 Nov 2026 12:52:03 +0100
Message-ID: <20261121115203.1444513-2-manuelebnerli@mailbox.org>
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
X-MBO-RS-META: kq9h5pne7zbd94u9cws6zfxk4b19mkad
X-MBO-RS-ID: cddeddc6df321b02dbb

Add comment to keep ver_linux up to date. This comment does not show up
in the output of sphinx.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
[v2]
 fix typos in diff and subject

[v1]
 https://lore.kernel.org/all/20261121113221.1442278-2-manuelebnerli@mailbox.org/

 Documentation/process/changes.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 13093c5c26..ffeaa3dce3 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -27,6 +27,10 @@ running a Linux kernel.  Also, not all tools are necessary on all
 systems; obviously, if you don't have any PC Card hardware, for example,
 you probably do not need to concern yourself with pcmciautils.
 
+..
+   When changing anything in the following table, make sure to update
+   scripts/ver_linux aswell.
+
 ====================== ===============  ========================================
         Program        Minimal version       Command to check the version
 ====================== ===============  ========================================
-- 
2.56.0

