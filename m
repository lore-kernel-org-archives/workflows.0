Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4CF5B5C8
	for <workflows@vger.kernel.org>; Tue, 28 Nov 2023 15:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gBugiC+V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A9C3C433C7;
	Tue, 28 Nov 2023 15:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1701185426;
	bh=3Cmyr5EczmNPcryfGL7HIrt4trEarUERTymLJSCLQhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gBugiC+VRdBQr5YB+/EWaYT623182cyFtA/CokPcGJ/OEFZ/ITrRudEAWWrLqjKxC
	 e6LFSzILViAYqvZjSzZz1cS0TaOVXR4G8milO5FuIMqWddsCNFjaEP022+c4UguIoJ
	 Rn3/kWM8knRL9hlbo9d0aV+hy6iNu2pascsFrWcg=
Date: Tue, 28 Nov 2023 10:30:25 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Eric Wong <e@80x24.org>
Cc: meta@public-inbox.org, workflows@vger.kernel.org
Subject: Re: extra search flags and params? (ispatch, replycount, ...)
Message-ID: <20231128-classy-brown-muskrat-7f07b1@nitro>
References: <20231128001028.M189230@dcvr>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231128001028.M189230@dcvr>

On Tue, Nov 28, 2023 at 12:10:28AM +0000, Eric Wong wrote:
> Would they be useful?
> 
> It's not currently possible to quickly search for whether or not
> a term (e.g. patchid:) is present in a Xapian document.  Having
> the ability to do so would make it easier to find non-patch messages,
> or easily filter down to cover letters, bot replies, etc...

I understand the reasoning, but I'm not sure we should be trying too hard to
make public-inbox a patch tracking platform. What makes lei great is ability
to automatically find and retrieve entire threads -- I feel like we should
leave series tracking to other platforms that already exist (patchwork,
patchew, etc).

> I don't think any of these would be required to get "lei rediff"
> working on entire patchsets, though (it only does individual
> messages, currently).

Incidentally, I've recently discovered that relying on git-patch-id to match
commits to message archives has some important flaws. Linus was actually the
one who caused this when he recommended that maintainers switch to using the
"histogram" diff algorithm instead of the default ("myers").

This made me realize that there's actually a multitude of ways the same patch
can be represented (diff-algorithm, number of context lines, etc) that would
cause git-patch-id to return a different value for the exact same commit.

So, while I know that Linus doesn't want Link: entries in commits that just go
to the series, using the message-id remains the only mechanism to reliably
link commits to the series discussion.

-K
