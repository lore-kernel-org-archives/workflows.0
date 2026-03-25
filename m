Received: from mout-y-209.mailbox.org (mout-y-209.mailbox.org [91.198.250.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729E840B6E1;
	Wed, 25 Mar 2026 19:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.198.250.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774467902; cv=none; b=s90Du+jdmGpGJq/uKH00ltAY6jEUHSV1Fuq4RUXi5+y4ExrQSXwu1XWvB/Jw/FG+Z1f4uEOn7T2V7X2Yj2WacIhTexRkTNMmR7diifwjzqEQ6S1F/Aktv33r8b29zPMEVc6+rDRHEqrDK4OnGtZxA3VC190Z3nNSldNSRLdaDi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774467902; c=relaxed/simple;
	bh=2rE3f64IYqeqBrkYB6a6PgA4RQDfGkMbU46Q5oPs/1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rUIhFHuhS423NZO3utwq/BUUBavhRIa+VR0tccYUd7RQFsdJIfaCR8V+epdBDRUiX4tK3tHTFKm20emEhuqX76W4rt0jjrUctHmIRaRdGoVCF6eFwUnZ9OQGPIgYLDx4gRuRs2BLfIkeSyOICr10skeF4TlkYf2HvmM81A9cgtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=u/QDokrR; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=B4Tj18aA; arc=none smtp.client-ip=91.198.250.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="u/QDokrR";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="B4Tj18aA"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-209.mailbox.org (Postfix) with ESMTPS id 4fgy6d0yM6zB115;
	Wed, 25 Mar 2026 20:44:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774467897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RMY2rXB5sCjSvWbuglMO9Fm8FaHaVajfBVzSz02485A=;
	b=u/QDokrR9NnCKM9JNZPLeDFtDe68W/50GauqCOPRwcu43gchCd41gcXEIps4l3GMojzAX0
	qXTfQBnn5rZW4BKdAH6hhasOwcLVCUjKhLfxMcS1l80zXw3D9W+AyFYqMPG4GeqOaMvGC5
	WVw7iLgQXDSSnSj/Dc3b0GkEgDsnhuBFpu7YFEkf10uJJXNjLWyDvT10WK+YfNnzaBC57d
	g2sf8ymn8GraNtCv7w2MpVDfCi9gY6y3B3MVOwBU1upKcVKtSkxVn3j7iQGMynGYbZ8YvW
	k63nGkuRMwMPoe4CFiIS42jgrBHp9gYRlajyZCiJCxH9zR2k6trzKOmWGHTLLQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=B4Tj18aA;
	spf=pass (outgoing_mbo_mout: domain of manuelebner@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=manuelebner@mailbox.org
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774467896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RMY2rXB5sCjSvWbuglMO9Fm8FaHaVajfBVzSz02485A=;
	b=B4Tj18aAQuKo+3ePOAxFhbNnGnW0bxO44jL/n9NORpZa69zsLR+E6SxUNcCOVw1DGxid0X
	m4nkh4GdzUB6Ji8r3h3jFCwLPf+/Ms1omlOcRyzdpITUiqdATysvBUwPW+UTUS/RPQLceF
	X9ArxRj3Yb0amySuPEVm2EdK6lYGXJ375CLqAvP5foKhQgj5iAiXVNodpA/1iM9ZYGrcLc
	4DpWah+hWJgdfGG+SKqrTkaiA1CVslc32He/SWvBukZKQzPvu5Reul+XLlJocFLhdNA0FY
	svlMeHilLsRa4Ev5PHa7255Z0f7ulJn5agdPDyE5wEj+7jDJYdk96Vvrl60Gug==
To: Jonathan Corbet <corbet@lwn.net>,
	Collin Funk <collin.funk1@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH v5 0/2] workflow, scripts: sort changes.rst and ver_linux
Date: Wed, 25 Mar 2026 20:43:27 +0100
Message-ID: <20260325194326.77923-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: tawir9o19cd4cmrj8kjbmubo3zqikgu6
X-MBO-RS-ID: b03e91a6e48a91cadb9
X-Rspamd-Queue-Id: 4fgy6d0yM6zB115

restructured the patch series into logical changes.
fixed changelogs, but i'm not super content.

 [v4] -> [v5]:
undo "remove (optional)" from [v4]
merged patches with same concepts 
 [PATCH v4 1/4], [PATCH v4 2/4] -> [PATCH v5 1/2]
 [PATCH v4 3/4], [PATCH v4 4/4] -> [PATCH v5 2/2]
fix changelogs for the individual patches

 [v3] -> [v4]:
split [PATCH v3 1/2] into
 [PATCH v4 1/4] and
 [PATCH v4 3/4]
split [PATCH v3 2/2] into
 [PATCH v4 2/4] and
 [PATCH v4 4/4]
make toolnames uniform in both files
make version command uniform in both files
changes.rst:
 remove footnote for Sphinx
 remove "(optional)"

 [v2] -> [v3]:
fix changelog
changes.rst:
 needn't -> do not need to
 add gdb 7.2
ver_linux:
 /Changes.rst -> /changes.rst
 add gdb

 [v1] -> [v2]:
split v1 into a patch series
changes.rst:
 add reference to ver_linux
ver_linux:
 fix path to changes.rst

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
