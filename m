Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD4D388E72;
	Sun, 10 May 2026 16:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778431836; cv=none; b=XlG4bfHz5KYZoZZA1+DfM6at9dps7uT8X7BfAtRBBdvBWr7RY+Ue0zvRnwf+zxJ3LD4uoPlYmMtHitkw90eNVks/nJFLXceMJcXrD9ggdu3JvSXW1c9dapu+Im6t3/QDn5u9a01h7TN6BXicNq7vDC6ks2f/O8IX5kzq8RS2ncY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778431836; c=relaxed/simple;
	bh=IXQJhGywu8OwXjC8G52ZXriPYdv9LYDsfuilc/Q0trc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iacxjt6duISlyO2bltG+6yoZV9Dqh2J3oy1EHR8YSN3gG8h3sMmcofVZsg2dTtrU/MIt+9nQ8P9fQvNtwmSNueYut8+GpJFJIvQdIKEmmz8uvMNDKN8UlYaGhY01NC3b/n3Z9aXwfTIB1yPyCgF3/WYdYilG58bYT6IsREI0cFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=T1unUNEh; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=UWB3vSQB; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="T1unUNEh";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="UWB3vSQB"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gD8486mKmz9tbP;
	Sun, 10 May 2026 18:50:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778431833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IXQJhGywu8OwXjC8G52ZXriPYdv9LYDsfuilc/Q0trc=;
	b=T1unUNEhVA5JFbX//mClpXR99QtS9UMVo4bvQnXsWF5sgGL+inIMTfQ7Z1o+pJTtFJlwyI
	XTkrX1NKmY9StkiMKuX3ZG8gAioxu66ns1wkqr3LqaEnSS1KtMG1T07mkO4GClYnAsp+Bu
	YCVsWR1nYirxBCulT3oBK2MMyrZO1NMwCBWLIwwqZiz4qLEsoMvM0Hz8A90uZ5EdruwBh4
	nJYXPCOLrxUMJwP3Gmh1d0dwW9ujZ0cWahwWpoikR6j/MCftD3j8M11wWnsITe/q+JXqfz
	RYCDsfE8DhEfGzvyRVzEksjRPAXxub2USUe15MQTKR//O8BtxfehBTiQ0ZzT7A==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=UWB3vSQB;
	spf=pass (outgoing_mbo_mout: domain of manuelebner@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=manuelebner@mailbox.org
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778431831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IXQJhGywu8OwXjC8G52ZXriPYdv9LYDsfuilc/Q0trc=;
	b=UWB3vSQBvsVCOQpfPjrccujR1sSFzQD4Qq+vhffPb0aLgnsQuG66IS23pq4L7E5mWDY2SU
	yFHSl5II4dHcFg2bdLW++rgSY0PIz0MOwiVWT+fHK3rPdUTzq6luy6gyPG5e4Rk4StoTeq
	qGLLXjGNp5ysf3b6YaSGxXpHfnPv25qmRNPUu8/tQ5UtmePnUtANPa0JsGQB0UqXWm+zd2
	p2OOHUyKTp7y3Yj4zWbv/HyKDFYKWyEQNdrC8z8rFWDVOeKaqlTdNM1S5ND9x/RMPZb7YW
	UCHAf7SknwARulK58ykPedo9VSWdqZc7HYB0xUyWcTX5agfKf3AFxPzmtbAAhA==
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	workflows@vger.kernel.org (open list:DOCUMENTATION PROCESS),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH 0/2] Doc, scripts: facilitate phaseout of strlcat
Date: Sun, 10 May 2026 18:49:08 +0200
Message-ID: <20260510164907.57176-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 4xnmjqp5ts9o1wbi8pn6di31ncgpkhhy
X-MBO-RS-ID: a713215e6905348f243
X-Rspamd-Queue-Id: 4gD8486mKmz9tbP

The goal of this series is to facilitate the transition from strlcat to better
alternatives.
