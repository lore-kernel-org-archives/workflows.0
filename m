Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FD7385D95;
	Tue, 12 May 2026 17:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778606080; cv=none; b=NPGDFDyUfl5d9yufk9Oq4HdNPR5XbuK4GuhDBSHNW3v0FlVdZkAh4LczRBGJYr+EyD+9rE2KF51G5mAY8lsW27r7Ud+6RbU7e5WeB6T6MeXw/6VGoMJ2+ANXSdIK8KmPmUddmvzj8B7gMFJDn8AoK0i9yeSRojZ8llAda0l/syM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778606080; c=relaxed/simple;
	bh=CxCtrBKKTRwjYyddIT3xIXWPrK5Mkl6rteQ00CDBDJE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cc1s/CdkNzPUBTb4sc1qCmenJEVXOUB3aJwC+JnW36dghMQSUuyLt4pmjJBFZay34C2YHGty/XvaRMBSwNwCeE4M2jt4Co8aMEnDySpMhSa8uBNXM98+17Q6NOer99v28GhTOKVzvfO8MITEWIrxgJYc1n4zm9kOonq6aca1/HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=TmnR212Q; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="TmnR212Q"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9C2E3410B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778606078; bh=zZT2Gr7FzYWJ/OMZRRAd/nVaMuoIgfl6eufwoozZjto=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TmnR212QKyjDOYBZ+yeMp6JXJJpBrRPQMSIG4KAqvNw0O/XJTsv3V1vDhOtv7jVsi
	 8QbAMztabL13YKX6dw/swu7cP9LGvQAhkg5AKeCD5zHmxykHo5ELuva2LbZbz+6BVt
	 RKtnDAdK0vnMIP7iA18Yucw7rK6E94HtjmnwGc5KkciCh0ptEc+NCmDCYhmWfU/Yxd
	 0aDmW3evHL7EtOjUWP4RscINTaB589dhw9vtQN8X7R0lrHe8emn7srj2hXfY5y/WU0
	 X6FfxfMtvfH88/gO4tUyZ95VMy6XShHOzJvxxZ+DMVhXlDfRZGsjAha1XFjnAJzsNj
	 t+kzmBZCCkQPA==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9C2E3410B5;
	Tue, 12 May 2026 17:14:38 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Willy Tarreau <w@1wt.eu>, greg@kroah.com
Cc: Leon Romanovsky <leon@kernel.org>, skhan@linuxfoundation.org,
 security@kernel.org, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Willy Tarreau <w@1wt.eu>
Subject: Re: [PATCH v3 0/3] Documentation: security-bugs: new updates
 covering triage and AI
In-Reply-To: <20260509094755.2838-1-w@1wt.eu>
References: <20260509094755.2838-1-w@1wt.eu>
Date: Tue, 12 May 2026 11:14:37 -0600
Message-ID: <871pfgpn2a.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Willy Tarreau <w@1wt.eu> writes:

> This series tries to translate recent discussions on the security list
> on how to better handle reports. It details:
>   - when not to Cc: the security list
>   - what classes of bugs do not need to be handled privately
>   - minimum requirements for AI-assisted reports
>
> As usual, this is probably perfectible but can already help in the short
> term as we can point it to reporters, so barring any strong disagreement,
> better continue to proceed in small incremental improvements and observe
> the effects.

OK, I've applied the series to docs-fixes; after a short exposure in
linux-next I'll ship it Linusward.

I have a couple of comments on the individual changes that might merit
an eventual add-on patch.

Thanks,

jon
