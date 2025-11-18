Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B206629BD8E;
	Tue, 18 Nov 2025 17:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763487769; cv=none; b=F146GsI0gAd2kGLHYEgMu6cQMMPEB9H14MSW3zAhbhbfxqtRvMpl2iJ/znbaKSp4styWas2kyC34brHP6NwRQPVAlqveIzI8jWqLbtvY73zgF59cTRVzFZHKs3y8xDvtfcIgApEqVjcGi9LkpaXJ3gGx4grDscfz0WCDeb+weBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763487769; c=relaxed/simple;
	bh=CUi9y8PeUQu5Ur1phLGl9hDckIyGY7EiGv8PbX1LBdg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Af+LqbkuhEs5dm5/u++XPnkUdpjknw4cIPAf/CO+8u/o8XtUp3l/SQZZN5c5D2/dwn2sxzkXGyzoDvrv/Gcs40WPCdRKJT2f0wA6Oty5GzYDaChIPxOCwzK6SP5Y1zz3tDZDvsJ/nMax38/P0DyM+Rsfl9bhaN665mujqyl4j2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=PMx6MWgU; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="PMx6MWgU"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D25D340C3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1763487766; bh=nmhsnPbynKHshcvM9TzSLCcfd/I1qgwS3VSOPpYT6SY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PMx6MWgULovyGm2T8jT7S3upgM1h62OCfz7ckio3Rdnp1i8CkRW1jSeqTBKf1BHmy
	 UccEaYaAp5OqYmCQIjDXE55uK+DqS3NhVCaDagQwBFkjHHTuJWVaDmSFnpIRAdn4/u
	 HgUY8sRePQs1dwT7mEk4mDWFocMHEnWSfIoPECpdl3JpO8lIOBQvFnzJsP78shijYt
	 z4UhdheAYKgAfW3cNrBjbV/+2Ql2bUGokLD4vPJzTkO2fG/ZIC2pFv/psNwljfX9fa
	 OUY05/CSz2Wp51UOGNqI5RCZACBQSTTX4YpSTKIiMydEWlkZGU/iIJdQJ1bvJxXNBn
	 jsLb8cphd6aTw==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D25D340C3B;
	Tue, 18 Nov 2025 17:42:45 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-doc@vger.kernel.org, josh@joshtriplett.org, kees@kernel.org,
 konstantin@linuxfoundation.org, linux-kernel@vger.kernel.org,
 rostedt@goodmis.org, workflows@vger.kernel.org, joe@perches.com,
 rdunlap@infradead.org
Subject: Re: [PATCH v3] README: restructure with role-based documentation
 and guidelines
In-Reply-To: <aRykPFH0sIfmARvs@laps>
References: <20251117213801.4077535-1-sashal@kernel.org>
 <87wm3n47u6.fsf@trenco.lwn.net> <aRykPFH0sIfmARvs@laps>
Date: Tue, 18 Nov 2025 10:42:45 -0700
Message-ID: <87cy5f44q2.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sasha Levin <sashal@kernel.org> writes:

>>Overall I really like this change.  We could quibble forever about the
>>details, but that's probably not worthwhile.
>
> Thanks Jon!
>
> What would you say about taking this patch (assuming this falls under the
> Documentation subsystem) if I completely drop the AI parts for now?

In principle that sounds fine.  I'd want to build it and take another
look, but don't anticipate trouble there.

Thanks,

jon
