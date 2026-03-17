Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062E23EAC72;
	Tue, 17 Mar 2026 15:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773759858; cv=none; b=fOsU/O/Q5rwS8idYzW9Ivwk/lks2q4Lwvwk/lYU6N51ztR3bCOD61HB45FRCCo1Ndu3RvnOebiGt5Q2xI/Aw4vmqZUVRWR7Mw5u3v1rpWqUKTvJDmJlfXqtHNh4uulGIHcqvZ++wqjlDx54SgBDwpQAUALPn+YnCrDblb8Cdw/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773759858; c=relaxed/simple;
	bh=8FRg6Legb0m+bXWcjSblKNSoSNDucxzixZw3fTcBUBA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OY7EMSNcySojygVx1ZZ7gkPfdlR4S8sIMqxk3w2vH9IEhPGKvqpbmLKH2foyy7zhct0e+U3eE631Av1pIxk8DwH0M9+iOEe4hDayETZ6PlrXfJuOPxGSZhc1Ju03/kthBqjmoMvKNIzha1NGjjVkMQPcPfclxehQrC4QeEIqbiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=fb2F2lvZ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="fb2F2lvZ"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5C08340C7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773759856; bh=kFiEOvlljrAW3OJr5B+qd22MS6ZV77J19exczjwLMjw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fb2F2lvZdYSemwfwjHo/brtejgsMhXkYAjc4d3YkbEbI8Q9pa6+ulDhbT5jixOJZj
	 x7+TF9bf1XYp/KOnrU1reQHIau9U1N4h6JUDu3xPTru9p5tHtFQT7oPpCAMmg03WnQ
	 hG5GS3r0AcXamHKy8FNGiCHlDAUD57W+/JeEoJjRPxl+mUfBs+7FLlDe1GVpMYPmIK
	 1p5in5eC5Ci3LQaSCe6e+tQX2Bc5agUbdkVocD6FWlaK/ax3LimnS2DVy43rPoVW5o
	 kRJ/XUFhzwcyeOwOWIzu/B3S/NeTtz6D5PTFFdvzbJhNU7AK3R7DWlulJOhCFtM2kD
	 EYehjJ8bPaAtg==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5C08340C7C;
	Tue, 17 Mar 2026 15:04:16 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@airmail.cc>, Collin Funk
 <collin.funk1@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Manuel Ebner <manuelebner@airmail.cc>
Subject: Re: [PATCH v4 2/4] workflow: process/changes.rst: expand and
 cleanup list
In-Reply-To: <20260311165612.184288-2-manuelebner@airmail.cc>
References: <20260311164935.183495-3-manuelebner@airmail.cc>
 <20260311165612.184288-2-manuelebner@airmail.cc>
Date: Tue, 17 Mar 2026 09:04:15 -0600
Message-ID: <87fr5ycxao.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Manuel Ebner <manuelebner@airmail.cc> writes:

> It is a pain in the ass to compare the software versions on the running
> system with the minimal required versions (process/changes.rst).
> Sorting both lists the same way makes side-by-side comparisons a simple task.

Again, this text doesn't belong here - describe *this patch.

> add reference to ./scripts/ver_linux
> needn't -> do not need to

That seems like a pointless change, but whtever

> make toolnames uniform with the toolnames in  ver_linux
> make version commands uniform with ver_linux
>
> remove footnote for sphinx
>  in the paragraph before the list it says:
>  "Also, not all tools are necessary on all systems;
>  obviously, if you don't have any PC Card hardware, for example,
>  you probably needn't concern yourself with pcmciautils."
>
> remove "(optional)" for the same reason as above

Here you have lost some information - now the document doesn't say
*which* tools are optional.  That is, I think, not ideal.

> add gdb version 7.2 as mentioned in:
>  Documentation/process/debugging/gdb-kernel-debugging.rst
>  scripts/gdb/vmlinux-gdb.py
>
> Signed-off-by: Manuel Ebner <manuelebner@airmail.cc>
> ---
>  Documentation/process/changes.rst | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)

Thanks,

jon
