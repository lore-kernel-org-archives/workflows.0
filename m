Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911D2230278
	for <workflows@vger.kernel.org>; Mon,  3 Mar 2025 20:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741034582; cv=none; b=YYpWsNAXHWhJY+lq3KAVrS9pd56ekLE4KEAXamRtR8NA/pkLHch7mxN62Y8w02Ow3U/4YO8fN+brcbPuutF30AsdZCv6S9BEe+dD/lvb7rj3nLfzIud1DaeiFLCdjI7gvov60JwSJpu3eo/eIJ61TIP6bdF4mwT5QAbhRuMvbvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741034582; c=relaxed/simple;
	bh=KMl6qOA+un5ihRyhmsDgcrTLmb6C+jfSw23QEKha4vo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XsLzbCGjgteu2cYEkIp0TdbuJ5svz+9xcqzz8xaSUFQ7CW5iDteag4rhHQFCc4GWVGGgUY1eDwXUHivZXJjSJtrPSRvKnohvq0RsD3RQIC4ZmUwdumEoyl47vqA5aX7PqHRpCneURQQpOcf6TRWEJmebJ7eH7SuleDncmwtJi9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=A5hjz9r8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="A5hjz9r8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDA6BC4CED6;
	Mon,  3 Mar 2025 20:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1741034582;
	bh=KMl6qOA+un5ihRyhmsDgcrTLmb6C+jfSw23QEKha4vo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A5hjz9r8fHkcyTTY6+bVt+0bhTTuXLMinC/pKQgggh4yg33lPz7tFd7o+m9Et3fl5
	 +0Suwrb6vjutBNsFHY4VX26y1emPTKpj/zXoh+fTMNz6AiyF5uVi5LC0ttChqWz6oT
	 6nfNHhpPlLy9MR8pZLuEMNs4emQPQDG7vcXXQ4J8=
Date: Mon, 3 Mar 2025 15:42:59 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: workflows@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: lei stores mails in wrong folder
Message-ID: <20250303-impetuous-elastic-gazelle-dcd5b5@lemur>
References: <475dccf3-f252-4ef7-bfc9-45fd58aa4fff@app.fastmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <475dccf3-f252-4ef7-bfc9-45fd58aa4fff@app.fastmail.com>

On Mon, Mar 03, 2025 at 08:40:26PM +0200, Leon Romanovsky wrote:
> Hi Konstantin,
> 
> I have a strange behavior for newly installed lei ("dnf install lei" on FC41).
> All new messages are stored in "cur" Maildir folder and not in "new" as I would expect.
> Current behavior causes to weird situation where all messages are getting "O"  (old) tag.

Unfortunately, that's not really a question for me -- lei is part of
public-inbox, so you should send this to meta@public-inbox.org.

Best wishes,
-K
