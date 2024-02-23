Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D80133995
	for <workflows@vger.kernel.org>; Fri, 23 Feb 2024 17:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708710584; cv=none; b=ZQsGt5ZeWVhIWE/bNCSu32ZIeqqBpu2GiXkKK76mk2LQmjN7JxKsIrWXtsZWLeAlNoAWSVv0LPRhT4RhhjKr4Ovu1DnOg8St/8GvR0Vlk88vSRU80XZWbZuNxFFkLArZRw/rkRVY6MZkRtGEowIlxN6ZQm2HRYEbE+35vtzRV3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708710584; c=relaxed/simple;
	bh=2zU3bdww+kRnEg9xkjTfTvqtOvSJY8yQ+x/uR+jPrRk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LPoRTyHHBrJBj6++8VPQtLIG1fHm7rOG940vJ736GqGsl8Xcslkl/KG3pamZnitZSp1GPQh61qTxNekNthPVHjpy3vobUKCcEMGgG7RtK9jz87+fcoqxnwxObIcgKEs5SnhA2y28hq2rvWnBzXtlFBAZCYoOSTlA8XLHar2ttA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ZmWwbKIb; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ZmWwbKIb"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7BD7747AA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1708710576; bh=3pmf1CRAN5qfsGjCQh/WgyPsUBYlu8alo+/caCn6Gi8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZmWwbKIbaVD2C0J7L2OhVB9lljwLfp3/Oj+wGkR6c/NNP6dJEgOpA/KXuHxr3aptV
	 V5G7TO5VlNK5W70mAUl2lP7SMewOGL54JD6VWEvcjwEQhF4wsmQYRLVQtwObk8jjnY
	 25sHoyW85iEt1PVMkG9WIosOUhzEouKJXiy/dVmKwKGN5TTOnyo3M3CVlng3grSpwM
	 hOhNJ8e5Vjghp6/Yv8aXSNEPMlbY8UUlDZpnGTdwKRekHqLmSaFiUJEWFHj1awnao6
	 6+mPaVw0bUMIIWIaWtaKhvpnxuWUpQBz/jzD5nuNlKZrloEcAKXoHqQXCp8lNH/AFW
	 tjZohgkFlGOXw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::646])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7BD7747AA6;
	Fri, 23 Feb 2024 17:49:36 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Jakub Kicinski <kuba@kernel.org>, workflows@vger.kernel.org, Konstantin
 Ryabitsev <konstantin@linuxfoundation.org>
Cc: ast@kernel.org
Subject: Re: Simple analytics for docs.kernel.org and patchwork, please?
In-Reply-To: <20240223083154.4fbee63c@kernel.org>
References: <20240223083154.4fbee63c@kernel.org>
Date: Fri, 23 Feb 2024 10:49:35 -0700
Message-ID: <87sf1j6pg0.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jakub Kicinski <kuba@kernel.org> writes:

> Does anyone think that even non-intrusive analytics are a no go?

What sorts of analytics are you looking for?  Simple logfile analysis
should be fairly uncontroversial and would tell you which documents are
most of interest to the AI bots^W^Wdevelopers.  Anything requiring, say,
javascript in the browser is likely to get blocked by the kinds of
people who might be interested in kernel docs.

We did an overview of relatively innocuous analytics packages a few
years ago:

  https://lwn.net/Articles/822568/

jon
