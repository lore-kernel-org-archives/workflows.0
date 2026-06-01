Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E62A33C187;
	Mon,  1 Jun 2026 19:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780340702; cv=none; b=Tu82L33HPtQbHwHBEgtLYRG86XLPbZLyeMdJEpBR269GGMTqlrFX245wRiCA1CSW/c7P+G3Gcbclqa8fg7Gon6493gLN3xj4rv7NEuHpZLsXshrzXsYe1J7h7Tjv4e5HTC4n7rJpLOcIanXdms5PkTKpd/d2gNkUs41gWWWnE+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780340702; c=relaxed/simple;
	bh=GgCmq5Sx9s8bC5iIaRxRmaG5hEg0VYVA9qf+jWCITPA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=knB2SetdHcCmpaNDxmKbmac9JuLyDwfICoNqkzA8u9J+Fghdd+pWupevWyyXdwe+Gz0CJUN5T2gUzlfWWfEwxAh4ya6kjGNYrYHu0Nj2g84l22adSQ4iGBxOZ+uDc98MOCmYWOsAwOGKxzJlWHjCivkkMWfnd+zkR59oP4eqsCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=j/EZT8SA; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="j/EZT8SA"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 776D340E49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1780340700; bh=QY9adMM/u6K6yRy3Qi2JoGvSNAfjPBtiJQSg1JIu6xY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=j/EZT8SAsjQfeC/4zQioNoDKhumWyJjp+tibzAM59DQg8H48j4kRDQXgzIDWgDHRu
	 vCqICY+XWsuj1htpCnl/Sdnu5BYDjfR+5dz0dbQgkjqVBOmRO0Us9mT3DIisMwPPO6
	 gCbjvQnLR6A1d3bp4XZ3HdaClDNpVgY1TlPrGpv72wt95JhO8r9xA5VS1j3pZguc//
	 B8vZkAuFQMbiQTbdxPEwLtQPltgtlu0ScGUtzv/7GTbHVODw61w69Drt5EL8rrWKeY
	 /7GNyjHjPtAfV6Kt/Edih7Kh9Jp3LHlYYrHKMvQitHbuYP/e2PqczBmCKmySkruocr
	 30oP1vRZVJ+vQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 776D340E49;
	Mon,  1 Jun 2026 19:05:00 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Costa Shulyupin <costa.shul@redhat.com>, Jason Wessel
 <jason.wessel@windriver.com>, Daniel Thompson <danielt@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Costa Shulyupin <costa.shul@redhat.com>
Subject: Re: [PATCH v1] docs: kgdb: Fix stale source file paths
In-Reply-To: <20260531140207.4114764-1-costa.shul@redhat.com>
References: <20260531140207.4114764-1-costa.shul@redhat.com>
Date: Mon, 01 Jun 2026 13:04:59 -0600
Message-ID: <87pl2a84kk.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Costa Shulyupin <costa.shul@redhat.com> writes:

> Update two file paths that became stale when kgdb/kdb sources
> were reorganized:
> - kernel/debugger/debug_core.c -> kernel/debug/debug_core.c
> - drivers/char/kdb_keyboard.c -> kernel/debug/kdb/kdb_keyboard.c

...which happened for 2.6.35 in 2009...

> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
> ---
>  Documentation/process/debugging/kgdb.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

jon
