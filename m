Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794092550;
	b=YsErWv630t5fSDCIFXD6eRaMB1owEV1wopHPJmBSjyIs1zFRek03IXK++RfX/ksCBZDG
	 UJJK6jFtYnWWvq4T20z93ZR+rJ1/Un3pVBKb55detRHK/71IoTsPB/QNh4baZL1MbKR7N
	 t0GNjEG5zaef30xRYj9eYOSVh8gX+i/7UftjoYXiXDebwd3IwjYNpRZBuZYpd2HIbN7iF
	 em8f/k0CPwvvJP5UO+qssQ2hMFJw/DhnQ20lImGWMVL16JsIgH4FopZnPmaD6Aw+Ygkm2
	 JNUUk8dSQ0awqYjB2k7iW6ZB4YEltO/Bk9aGpI3pHcDyrPcF6V5//ULidRLnZLbLhag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794092550;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=0hFouMqOeYyeKhZ85sDPfJfrYfZA6d+gJ4WrPszogio=;
	b=n91mZOCG7qZ7CCotZVVcmFbR7U8LeHbGsqfaSqWDxXxsWgQXgVgXiROfpu6UM5DTVG5F
	 eNt2TXigk6uKozBDlpAHTl2U1f6eoTjkbzR+YKElo4ezmufKYgmksxwpua76PksSh3+ox
	 8WqwcBjqDk8AXz9HpIofeHzPh7ikQAZ4FstCx3fdrpWJeiyju/oIkQBR+kJ2VR8LHlShK
	 dBZu/pNk+hQ7EBBzSdk1ewl3UnPALvJzKshL5vAg4w5CDtWo6ORILnS1xpWF0c8ODgFUE
	 IVsBtHIgS+t0wh2T8clUiuYwOKfSm5j/RfP1CO+ugwfymX8TOg7Xr/QyGhdY3ktFt8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=rLfkYRN8;
	arc=none smtp.remote-ip=185.70.43.100
Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EB2606A326
	for <workflows@vger.kernel.org>; Sat,  7 Nov 2026 23:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5EB2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=rLfkYRN8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794092538; x=1794351738;
	bh=0hFouMqOeYyeKhZ85sDPfJfrYfZA6d+gJ4WrPszogio=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=rLfkYRN8PyktjxiGFlQTpKqHwO5BSUsrQZwNrMsFry+BGKSNNZq8FUToNoPLEjqMh
	 EswXEKS5BWT9MtZ8Bb79XWC46EkLGsnUlQ4no6H8aaEI7YnYDUplZkrJWhY0nSi8dD
	 Q9XWEgioUkRSX2r+doOYdOGJowkDUekYjchabW8Upevz4M5zb9pyOUlgXNfgqOxDHp
	 sVZhSwZJ8uS011IT3Rww6XdEpBaa/XBJDqgr0Y33gKSwsMSsD51fDqSqyODwssdemV
	 76Dh/22qm7ICEItfLz1urR6JlBwBlE6tjoZo/iXqrZbAd8wkkYNrp7G0JsdNH2LQCP
	 wk/ADzt5tB3RQ==
Date: Sat, 07 Nov 2026 23:02:14 +0000
To: dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com
From: Mauro Codella <mauro.codella@pm.me>
Cc: joe@perches.com, corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, workflows@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] docs: checkpatch: Fix DEVICE_ATTR_WO macro name
Message-ID: <20261107230208.326769-1-mauro.codella@pm.me>
Feedback-ID: 135342123:user:proton
X-Pm-Message-ID: b9297a89896b6ad5ddd8eb990ad47380ae37be5e
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The DEVICE_ATTR_WO section refers to DEVICE_AATR_WO, which does not
exist. Correct the spelling to match the macro in include/linux/device.h.

Signed-off-by: Mauro Codella <mauro.codella@pm.me>
---
AI assistance: Codex identified the typo and drafted the fix and commit
message. I reviewed the change and ran checkpatch.

 Documentation/dev-tools/checkpatch.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-too=
ls/checkpatch.rst
index 6139a08c3..f8ab22c18 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -389,7 +389,7 @@ API usage
     See: https://www.kernel.org/doc/html/latest/driver-api/driver-model/de=
vice.html#attributes
=20
   **DEVICE_ATTR_WO**
-    The DEVICE_AATR_WO(name) helper macro can be used instead of
+    The DEVICE_ATTR_WO(name) helper macro can be used instead of
     DEVICE_ATTR(name, 0200, NULL, name_store);
=20
     Note that the macro automatically appends _store to the
--=20
2.56.0


