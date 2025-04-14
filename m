Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B36B1F236B
	for <workflows@vger.kernel.org>; Mon, 14 Apr 2025 16:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744649217; cv=none; b=AugyFEEfL9JAky3g1deqh74Vfc6pTzdTHjVaKbwj/Ff/yKq4ybfdHSKnetqOBdKmmn/M+UkzmcS8xogNRjukpS40BXpsL4wA7AHlP1yOZpjT6qpbzPNo0jHU59OoNVPQaIp8Eq6hHyAIqZvk2ll1O0MaJpmi6rQ5QP73tVLvUtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744649217; c=relaxed/simple;
	bh=QSqAQpkHwlIPBXHz8PdZKxoGQWUumD/jyBjqBHxW60U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KuAVESwEXw4qe0Ow9if7lAnbM/V+Nq+Tbf4+0FIk7QiU8D2ZD3AoSD/fTt3u0PygvKUjTUY0F+0qF/BYA2Cqk5zGtopuSKMLe3i7X+JRrMsBKsZuyY9Cy6lcHxBseL/ioRW0yee70CiBIunMYXJIIApgQcYHAbFsD599wnb2zbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ZW/M6BUQ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ZW/M6BUQ"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A30FA41062
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1744649215; bh=fOrOS8uLG+rK8Xg/zda1XgspN/8aoFzrBUuT6OtIgFo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZW/M6BUQkCz8rE9dPhP53cwsXOAc9BV6ZDqH1h6OS+ySJDyJ41/Akr6TizefOTYh9
	 eqjM2YFzvs1C07SHUFTaWw+Q7F5AVMWQvMsj5vvZky0E5Ts5QHK95VqMiNA3B3qCCo
	 YtmQaue0E/D2+TFuKwWeKfnLJJ8esfeyYAKbZHTcG9gX+8sIg+wMqKTGK3miYgAxWS
	 3IR05Q8I8iGAPux/zY5wNd9SHKXnx78Bb0Ea0E7G7jYWkd0tAmTlllvcKg8Rkakbrt
	 OeuSyUZw6eSo219QKClLTvqrg4c4ftHKUmKMBv5aFdjGTJcWsad/BeEZxosysYwkGl
	 rOE07h0StUgWQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A30FA41062;
	Mon, 14 Apr 2025 16:46:55 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Ammar Askar <ammar@ammaraskar.com>, workflows@vger.kernel.org
Cc: Ammar Askar <ammar@ammaraskar.com>
Subject: Re: [PATCH] docs: Fix conflicting contributor identity info
In-Reply-To: <20250318235331.3566174-1-ammar@ammaraskar.com>
References: <20250318235331.3566174-1-ammar@ammaraskar.com>
Date: Mon, 14 Apr 2025 10:46:54 -0600
Message-ID: <87wmbm8zcx.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ammar Askar <ammar@ammaraskar.com> writes:

> In commit d4563201f33a ("Documentation: simplify and clarify DCO
> contribution example language"), the patch submission documentation was
> updated to remove the note about pseudonyms and instead simplify it to
> allow "known identities".
>
> The process documentation still explicitly prohibits pseudonymous
> contributors. This patch changes the process documentation to line up
> with the submitting patches document.
>
> Signed-off-by: Ammar Askar <ammar@ammaraskar.com>
> ---
> I ran into this page when searching for "kernel pseudonymous" and saw
> that it conflicts with changes Linus made in the patch submission
> document. Figured it might be worth updating.
>
>  Documentation/process/1.Intro.rst | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/process/1.Intro.rst b/Documentation/process/1.Intro.rst
> index c3d0270bbfb3..25ca49f7ae4d 100644
> --- a/Documentation/process/1.Intro.rst
> +++ b/Documentation/process/1.Intro.rst
> @@ -251,12 +251,12 @@ there is no prospect of a migration to version 3 of the GPL in the
>  foreseeable future.
>  
>  It is imperative that all code contributed to the kernel be legitimately
> -free software.  For that reason, code from anonymous (or pseudonymous)
> -contributors will not be accepted.  All contributors are required to "sign
> -off" on their code, stating that the code can be distributed with the
> -kernel under the GPL.  Code which has not been licensed as free software by
> -its owner, or which risks creating copyright-related problems for the
> -kernel (such as code which derives from reverse-engineering efforts lacking
> +free software.  For that reason, code from contributors without a known
> +identity or anonymous contributors will not be accepted. All contributors are
> +required to "sign off" on their code, stating that the code can be distributed
> +with the kernel under the GPL.  Code which has not been licensed as free
> +software by its owner, or which risks creating copyright-related problems for
> +the kernel (such as code which derives from reverse-engineering efforts lacking
>  proper safeguards) cannot be contributed.

Applied, thanks.

jon
