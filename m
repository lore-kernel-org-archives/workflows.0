Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1751F1DFF7
	for <workflows@vger.kernel.org>; Mon, 26 Feb 2024 19:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708974368; cv=none; b=GhUx0zTOW9jogzEvNpF9H0Z732+54GLfQ9gIHy+RUKg4K+PAao3TmLTmRhL7gsIakOivAQksV/5Z+ediQetalVQzsr7roOJE6NDCggCc3NRHKjYh1/KNMdw3ln5IsijzU4wVpV0fXAyQq9042YLWaUe+xELIlX937JxlQSJByAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708974368; c=relaxed/simple;
	bh=vl9HfprrI7iNUlfnsdRrmSfgQrPeRzCZDAmWL+VlrJU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cf3paG7ZGJB5D+jvzPVMTWba7uPlkaat1qAQUGbboDmVEYLv7vAcYyojGHAFZuYyJGJOTewmg9H0ZZmW4OwIL1yhQ5cfEd2nqMc39X8zVMMFOX+wWcnSTuwew5n78lbyFICTU4dy4UT9DrEN16pnBkDX5qXU6xqE6gxJzaEA2Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c7ZaqreM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c7ZaqreM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A791C433C7;
	Mon, 26 Feb 2024 19:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708974367;
	bh=vl9HfprrI7iNUlfnsdRrmSfgQrPeRzCZDAmWL+VlrJU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=c7ZaqreM7oa0f3WJBOTqPxnIL+dSstBdBOFu/nhcreNh1HbGnXaqpBuiWxNj79zfE
	 GIX7DNuF/85ar7XDEe1KLja4VQby1bB7dibLqxM57HApSHOPFhGDiWoWE/InEtXhjn
	 QvENbW6Kkrz6HikDh60Fw2np+pBuRQ8iBQIrMyKIaVNhg7p6S/fCP2v8UWYpdJ40Ac
	 Win+pVjetzhcmRYunCKcq1yXUTmAGZfNbwFQi0bnXLHBVR8lb/LKLM/8agZYOWrnXi
	 WQQofnur7DCHYqa8LfWX2e514P7SbIGnuo0VDq9wio0XLf69y7d+bg0XSirpUHeGNu
	 /1pB94/1IXfgA==
Date: Mon, 26 Feb 2024 11:06:06 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: workflows@vger.kernel.org, corbet@lwn.net, ast@kernel.org
Subject: Re: Simple analytics for docs.kernel.org and patchwork, please?
Message-ID: <20240226110606.1420fcf8@kernel.org>
In-Reply-To: <20240223083154.4fbee63c@kernel.org>
References: <20240223083154.4fbee63c@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 23 Feb 2024 08:31:54 -0800 Jakub Kicinski wrote:
> Hi!
> 
> We have a few netdev-related bots with various simple status pages.
> I hooked them up to analytics recently, here's the dash:
> https://plausible.io/netdev.bots.linux.dev
> 
> Plausible was described here: https://lwn.net/Articles/822568/
> it's supposedly-open, and privacy-focused, no cookies etc.
> 
> It's useful for me when deciding where to invest my time,
> and to back up the efforts to my employer with some data.

Hi Konstantin, are you open to trying some analytics?
If yes I will go ask for approval to pay the bill.

FWIW it's not a lot of work, for netdev pages I add
the tracker with sed:
 sed -i 's@</title>$@</title><script defer data-domain="netdev.bots.linux.dev" src="https://plausible.io/js/script.js"></script>@' $file

If there's a concern that other maintainers don't want this
we can selectively sed just the networking pages?
