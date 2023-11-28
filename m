Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A393D0C1
	for <workflows@vger.kernel.org>; Tue, 28 Nov 2023 20:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Nfl5Tq3F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CEF8C433C8;
	Tue, 28 Nov 2023 20:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1701201610;
	bh=TjHbc6HPe7MVPo7CRI37kB4RBlJXsS5sZb7CGvOQLx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nfl5Tq3FIJ5c7EzGFndWw+LiYDG81VQudPd6IQzYRgkgwwyvfZQxb/GgmomQ1IodJ
	 UTKezrWhKo5LPzxP1AtMNNDQKGNVaiHpwFkHGL6h0lpAwiR630LjWhRpSinXbNyli4
	 3yQ6hg91Zw9kD+FaZVBVOSH9hlnZ7kS8vCLaxOGk=
Date: Tue, 28 Nov 2023 15:00:09 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Eric Wong <e@80x24.org>
Cc: meta@public-inbox.org, workflows@vger.kernel.org
Subject: Re: extra search flags and params? (ispatch, replycount, ...)
Message-ID: <20231128-nimble-meek-horse-8a71b9@nitro>
References: <20231128001028.M189230@dcvr>
 <20231128-classy-brown-muskrat-7f07b1@nitro>
 <20231128173509.M955004@dcvr>
 <20231128-pretty-sidewinder-of-pluck-a61b0a@meerkat>
 <20231128182003.M860390@dcvr>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231128182003.M860390@dcvr>

On Tue, Nov 28, 2023 at 06:20:03PM +0000, Eric Wong wrote:
> > Ah. I think here is enough to just say "s:* AND NOT s:PATCH" without
> > introducing additional xapian indexing parameters. Though, perhaps the web
> > interface can also gain a "collapse threads" view?
> 
> topics_new.html / topics_active.html endpoints?
> Also, '&t' is a weird accident that happens to work:
> 
> https://yhbt.net/lore/git/?q=s:*+AND+NOT+s:PATCH&t
> 
> I suppose that's OK for the majority of cases.

Nice!

> Though being able to find unanswered threads could be helpful.

Note, I'm not saying it's not a cool feature. :) However, I imagine people
would be more interested in searching for something like "show me all threads
mentioning $foo to which *I* haven't replied yet". It's not quite the same
thing as "nobody has replied yet."

I have no idea how hard this would be.

-K
