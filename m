Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EB4149C6F;
	Sun, 12 Jul 2026 11:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783857416; cv=none; b=HvFzQF0Liwz+xu2/BS+jdFX2X8C0Avtqyb7BN3QNV0PqP2/MiUroLspt638z0y79b5tZDbskl+/ywpOx0UnbIudAdSLl+NtLyqVqvEhM3qKLq9gNNvnj3+dJeYKgv9sSNuaTl5u/UVRI2kS25Y3paJTjMNVFFu+lbJwCDE+5fuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783857416; c=relaxed/simple;
	bh=5whW4ebTAMtdcD0xnANVI4vJXYikg9p3TwCT2n3c8SI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s1NNR6mCIh948G8rp+/+s2f9sErURyLmDIqwwrDkNY17ZoStGucYz1fS+Nws2VoF2rdsa2N/JTmI9teu4ORpDNn4VaGzFKfW0BhUBcgVspuUHlyGG9XHldiXP3PO5wBwrWcxwIEwfZjNF2l0Jh1OWY5WK8nM+pBy2B01Euot0UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=TivjPfZO; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=NfV4K+ZZ; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="TivjPfZO";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="NfV4K+ZZ"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gykZC4nBRzKv7G;
	Sun, 12 Jul 2026 13:56:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783857411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5whW4ebTAMtdcD0xnANVI4vJXYikg9p3TwCT2n3c8SI=;
	b=TivjPfZO7VYqE74cd4+acWxWWREAKJwT4e1cQBU68vfFWmEEmOXIBPUWolDMMb5kfqbXy5
	DbF3vp2UaZIQCTdM+lYO7Jwz8jacEIIYqRgmwX1tUbO6IMSwFe+xM+WxFXZOeGkMx8M0A4
	zXHoTzg3vYujzVevz5C/k4ujWVtomst8GkaXEpr3nS2MoVY915JVU7AZyZmQbNn45pXSuH
	h3JbHhkfQCcRyRyRt9IhZUReyy/QuB6UHhRFuqi7186F4PzF/J6sncxoLuxPRgEwrLY7oa
	cYoyjWD+6X/pGw6VtEqN/+xv0vWop2MfioyYu+6s+H80zbxiFLn4X/83WQERTg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=NfV4K+ZZ;
	spf=pass (outgoing_mbo_mout: domain of manuelebner@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=manuelebner@mailbox.org
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783857410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5whW4ebTAMtdcD0xnANVI4vJXYikg9p3TwCT2n3c8SI=;
	b=NfV4K+ZZS6hASl1CANc1zZ/RJrbohDpRRZwfqEcZeIVbKCP81mB+1R+eUgvfUdiSwwysjr
	Nyvosv471KKdFgek+2pYiEOJ/GvuvrRjwwcUg3qaQTlg+DscUaXpC95iaxtOLexOC2hvoQ
	t5xY9XQqKQbWmdnV3AwuhYMPlBD93+ydZKgsGVDcJuXhXXS6wL6VKo5F0X1SznM/VL02re
	ot9tc5PbIX5NaOCzQtvgojRCJ1U8IV7r5KPKQQPUyuesx/zsdG4434Mk3reHxTsvCdcU3G
	BBUb2OZXdVAnOdOC0HC8UeRfhl8tT3Q0MpRToGPP8NXbwjcKv4c9A33Cm/cX3A==
To: manuelebner@mailbox.org
Cc: corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	workflows@vger.kernel.org
Subject: Re: [Issue] maintainer-handbooks: html: list has duplicates
Date: Sun, 12 Jul 2026 13:56:41 +0200
Message-ID: <20260712115642.481583-1-manuelebner@mailbox.org>
In-Reply-To: <98a558a87a07ab641f47c66c372ee7ed0735f4f5.camel@mailbox.org>
References: <98a558a87a07ab641f47c66c372ee7ed0735f4f5.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: i535ua5r6fu3k343q5caotkoqzwhexz1
X-MBO-RS-ID: 9911b0fcf20cfbe3313
X-Rspamd-Queue-Id: 4gykZC4nBRzKv7G

There are only two patches which can cause that:

commit 8eae6da5f56c ("docs: auto-generate maintainer entry profile links")
commit bda185c30593 ("docs: maintainers_include: Only show main entry for profiles")

Therefore adding Mauro to recipients.
