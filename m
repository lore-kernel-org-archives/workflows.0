Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FD332E692;
	Thu, 14 May 2026 16:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778774907; cv=none; b=GibwDxdq1YE3jg09sh2qPJ+By/fAiuNhMJlAzAgAVBKGUZgOS3YmUjF6sFK2x3MMRUDvCeyA0UwJE8IVNJ2cN8bRuCp6O/iDP8wNet6n68CxGcz3eXtTFWJ0czoqiPOwIqEaB8yaEMdV5PMUkc6J4nbX8SjrUoT4G+An4xq501s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778774907; c=relaxed/simple;
	bh=3dr74om9/Dw5BriUzgJGyfU2LKenMT8MrqzmJ8XDEc0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q+5MY61Yd4j7SmkYtZuOx6+uanmPrDjFaNVO/m1lPHWohH4BjAWD1J1JTybyS1xu+Ip3jxBlJH1VCB3REkIqbbRvx+CTDpUGf7tv9l8DUkG7ryzs9LF3oQBly+iEw/T78LdOmOXl0qwziP7hvYb6iSYWJaXpYoQae2EcpkUN0N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=CFUBsaa5; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=PBUwCBu/; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="CFUBsaa5";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="PBUwCBu/"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gGZxf6FJCz9vMM;
	Thu, 14 May 2026 18:08:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778774902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TOGv+ouVJ1XBEFDvKMHQ1+L/iKpGM6kZyaFxdmuzq/U=;
	b=CFUBsaa5QnsHdppDBPLRLl7fb+cmTmWz6tlAHnaD+idDutZXuTvWUVtCM41LwX4yjtyA6d
	Lq5BQwNHK1aKlhC+aXKs3dkGzXENoKqG5TIdELUBgGlkqUukfFdJymRU8b0bYe7hJA8FIs
	jfEBL1sI6hGE3mCVcATJ8p+0li3wmjBTshDhbUvytbhL6tZ3FcTu/m+elM+KcIpa2i4Vt2
	ImsvSWZPfwfychwPaMNTXx+sRXWPU5pTENRtCwtfsYk+qxUIfYCBX0gZqlSkFuoADyrCVD
	QRPIO0B9FQ27d393gNa0VVnbCAYkuFLb4aXOtoxmeW4mLvin2wjAFY74xB32eg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="PBUwCBu/";
	spf=pass (outgoing_mbo_mout: domain of manuelebner@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=manuelebner@mailbox.org
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778774901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TOGv+ouVJ1XBEFDvKMHQ1+L/iKpGM6kZyaFxdmuzq/U=;
	b=PBUwCBu/t2dphZH5YBWvhI+N8vht/kx/p1ATmbooaiUcVxK4TwtC1mPMdEMdlDRJD86qqo
	88dfevuF3/KgzgIYhkVum3xBzCu2e0a73i7tdUQIqvywJMqE3VxcZ5Gs4DLEbrZtHY1+5k
	ehFp7GqgyS07Pz8CuQ5U3Ky8GsmYaF4apwO3w3Q/Nc9mUnbaVP1LiFdZQr8wN818mjMExZ
	GPb9Lqo9uMJ7x5zCf6GCRFmQXwYrZMC17V4FrWlL1V3taZK+Drt8db1EBfwru6k/sJrUQ0
	zK+rDh9BfT214dKIXHfB6SBfoLhqBdNt0wiGvygCvuT2PfLWUeKVWO3nUDE0KQ==
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	David Laight <david.laight.linux@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	workflows@vger.kernel.org (open list:DOCUMENTATION PROCESS),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH v2 0/3] Doc, scripts: facilitate phaseout of strlcat
Date: Thu, 14 May 2026 18:07:21 +0200
Message-ID: <20260514160719.105084-3-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: eeb4bd779a8e4c22fe7
X-MBO-RS-META: ykdmywpo393xqmasw5h43pdkxpghons1
X-Rspamd-Queue-Id: 4gGZxf6FJCz9vMM

Thanks for all the feedback. I tried to incorporate it in this version.

The goal of this series is to facilitate the transition away from strlcat()

[v2]
 add recipants
 add remarks to strlcat definition in
  lib/string.c
  tools/include/nolibc/string.h
  -> [3/3]
 
