Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCA32DCC1C;
	Tue, 17 Mar 2026 15:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773760121; cv=none; b=oHpuiGvHpz00mRlbHOihLfIUSwSNXdIdSXCIxxj6zwrPbo+6bMEZzrshHVrJwZIe5Z7NUkhPJ0jciMT53FhsBrlqLHb21o4/DYM2a7Y2Efc/+TkugJnIeY8Vlhpx2ViGw5UPuqWR4xZzCHiUfTm9lLDUmJOX4G0736s+Tj4YtCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773760121; c=relaxed/simple;
	bh=VFoALqe8rtJCDOkT4+H1O72SLy/sjIzsK4vg18Yt1Mc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KngLZNRGffhCnXjO0MY76GjHyLwiWZVs51+8lVqSgGIongwjKVnVo2rOS47XsIY3gpjWMzAxs66KzuhtuppS3/hUYsiAI8N2cBFriUI5XiDfY1efmGHJByHLmkafBUg30s3e16V87+Z07vvmLglezNm4o/9Drq6x72QhSyDWVGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=XJFgT1yr; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="XJFgT1yr"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BC9F540C7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773760119; bh=8vYKfYBoiRGStpn90uHCaibqaDnfD6D3sJs+W1L1KSQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XJFgT1yrcmo4VEKMVJAvQggVD2E+NWmkisMgpPbG2rTtGvp37ssnqKOE25ENl8MnN
	 U48Sjk8c1or7M1D6W/ysBMT6PMIrAdwE+QxyERHcutUtMox0Zn71VZ8+DTVHlQ85bP
	 UsHGjhO660dGRyqJ4PzxJqYwPx8v5lS8USkqL71Oj20bPMzc+xR1pFGx806czzGwTH
	 4E5QfdE7KlhsRXw9knf456U0b6LUa1bMNmMKBNXhprGKojb/zQ4N0fXu7c78rip+y8
	 g91qu4TV1onSNweAMAjziotcxYSWZCkABMjAYXi9UYKri8RSs1WPjoDgkHMvLUT6L8
	 42sFVbmyPPGXw==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id BC9F540C7C;
	Tue, 17 Mar 2026 15:08:39 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@airmail.cc>, Collin Funk
 <collin.funk1@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Manuel Ebner <manuelebner@airmail.cc>
Subject: Re: [PATCH v4 0/4] workflow, scripts: sort changes.rst and ver_linux
In-Reply-To: <20260311164935.183495-3-manuelebner@airmail.cc>
References: <20260311164935.183495-3-manuelebner@airmail.cc>
Date: Tue, 17 Mar 2026 09:08:38 -0600
Message-ID: <87zf46biix.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Manuel Ebner <manuelebner@airmail.cc> writes:

> It is a pain in the ass to compare the software versions on the running
> system (scripts/ver_linux) with the minimal required versions (changes.rst).
> Sorting both lists the same way makes side-by-side comparisons a simple task.

As noted in the individual patches, we're getting closer, but not quite
there yet.

Also, overall, I am still not thrilled about you having send me patches
under a false name.  I need you to, at a bare minimum, acknowledge that
this was a violation of the trust that the kernel project depends on,
and that the current name you are using is the real one.

Thanks,

jon
