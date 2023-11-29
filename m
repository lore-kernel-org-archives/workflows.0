Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=80x24.org header.i=@80x24.org header.b="E4MNE2fy"
Received: from dcvr.yhbt.net (dcvr.yhbt.net [173.255.242.215])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27C2D1BFB
	for <workflows@vger.kernel.org>; Tue, 28 Nov 2023 18:15:43 -0800 (PST)
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
	by dcvr.yhbt.net (Postfix) with ESMTP id 443031F406;
	Wed, 29 Nov 2023 02:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=80x24.org;
	s=selector1; t=1701224143;
	bh=cy9pZgIuSRZZM4YojLotScqXQ8qX9F1R3G8c7IJwKcg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E4MNE2fy+VqczQip7XhwpAGmFev0bhEAKqW0qsqP/dBTXkEky1mBDHUuJbjmbctP5
	 TPDHrVZ4+rS2fbXxB/D442XK249A1RzXQPzdQVhZ6vKLsK7PMbu0V67Ihc3ijidJ6x
	 EfeUEeo7NUbRm3qiYk4nq1VEttbQxOdzx1VGdSpU=
Date: Wed, 29 Nov 2023 02:13:06 +0000
From: Eric Wong <e@80x24.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: meta@public-inbox.org, workflows@vger.kernel.org
Subject: Re: extra search flags and params? (ispatch, replycount, ...)
Message-ID: <20231129021306.M200830@dcvr>
References: <20231128001028.M189230@dcvr>
 <20231128-classy-brown-muskrat-7f07b1@nitro>
 <20231128173509.M955004@dcvr>
 <20231128-pretty-sidewinder-of-pluck-a61b0a@meerkat>
 <20231128182003.M860390@dcvr>
 <20231128-nimble-meek-horse-8a71b9@nitro>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231128-nimble-meek-horse-8a71b9@nitro>

Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:
> On Tue, Nov 28, 2023 at 06:20:03PM +0000, Eric Wong wrote:
> > Though being able to find unanswered threads could be helpful.
> 
> Note, I'm not saying it's not a cool feature. :) However, I imagine people
> would be more interested in searching for something like "show me all threads
> mentioning $foo to which *I* haven't replied yet". It's not quite the same
> thing as "nobody has replied yet."
> 
> I have no idea how hard this would be.

I think notmuch can do it:

https://public-inbox.org/meta/20230412000654.M9394@dcvr/
https://public-inbox.org/meta/f8156a76-f4ac-8fc3-0eae-0c3a1a927ddb@intel.com/

So can we, since I've started using C++ in xap_helper and will
introduce RLIMIT_* support soonish to keep performance in check.
Going to see how much punishment the ancient (but fanless :>)
CPU on yhbt.net/lore can handle...
