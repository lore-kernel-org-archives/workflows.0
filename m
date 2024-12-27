Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693005733A;
	Fri, 27 Dec 2024 19:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735326455; cv=none; b=GysPZWcakjEkM5RotlYjjbEdElkCRsFmyHDTJNtM/x78bcz/bvWt1JG2Sr09/nOXsF+FXW1SXGfLgvU1uFci3fjCZm3ek+fU4szAqayIoSxRXkmU81ukHECiBum6fbd7hAkHTP902/gOWBw3cFIlPzpnIR0Whpa9+8PmuJ2vbfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735326455; c=relaxed/simple;
	bh=T4wPkBmJyPTPHQLq/9VVaSy5gMu/3w+J0UtAPBlMdPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sWZDOkgDEq0HT88qV16hdAABXkBMCYDhOe9Y4+leZ0ZyDfsg+Jyux1nJh7khBSGV/TRwq+P7iZMBxf7OdgTqCKT2gV87dA891Tdec6l6F5Tecv9gJdD/7pHBcQdvrxgwB/Gss/WttUQrDb8WADixOj1XWZxGPUlvTXMO+efsogA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tib3X07e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tib3X07e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0B74C4CED0;
	Fri, 27 Dec 2024 19:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735326455;
	bh=T4wPkBmJyPTPHQLq/9VVaSy5gMu/3w+J0UtAPBlMdPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tib3X07esJ7wVfGCmnrfB90F8kr+lHX8qTwXwCPk2lEE6x46YlJq4/Tfd+iSLDUqI
	 62aRcWr7oBLXU/t9HLBZ03sHsgHeSYhqEciHvNpzDzwZMf8g7UZv1oPTc3FvSgzz0X
	 MFxkGYFrqBJD7L98u98CHZw3P4jGQm9ZW1cMK5KO9ps6j5Q7qZQwHMdzT8+0msgLYn
	 DZsxB0CYl48iziZzvd2U2dK8DVUZwElkL2ArUSGLOujM91QdoaUYBN+ZtDu4lsc6AA
	 Uup9OkCEzMi5V/UlCMTdrKFAnDriLkDj/tfqPSkW9u48oINcywjRVt/6ea8xWIjk0y
	 i7A94zi7BZLhQ==
Date: Fri, 27 Dec 2024 14:07:33 -0500
From: Sasha Levin <sashal@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, apw@canonical.com,
	conor@kernel.org, corbet@lwn.net, dwaipayanray1@gmail.com,
	gitster@pobox.com, horms@kernel.org, joe@perches.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux@leemhuis.info, lukas.bulwahn@gmail.com,
	miguel.ojeda.sandonis@gmail.com, niklas.soderlund@corigine.com,
	willy@infradead.org, workflows@vger.kernel.org, kees@kernel.org
Subject: Re: [PATCH] git-disambiguate: disambiguate shorthand git ids
Message-ID: <Z2769aUCgYzyuKO4@lappy>
References: <20241226220555.3540872-1-sashal@kernel.org>
 <Z23ZmVwgS2ErX-dj@lappy>
 <CAHk-=wiPNpQ=zmGvPoZRMFZ7a7mm2pzSoOsuQPdDRaSF7gbw9w@mail.gmail.com>
 <Z237CwC_YKhoZubs@lappy>
 <CAHk-=wiH=HH9CfFFuBwAwDdfZAjCzN=yAhzWehCAR8bg_-2CAA@mail.gmail.com>
 <Z27TkUSmM1sCTslO@lappy>
 <CAMuHMdUT0ZBwVZMPMuJnHy+-DS0zqLV3t4MRhSQVpLjEsNuHgw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUT0ZBwVZMPMuJnHy+-DS0zqLV3t4MRhSQVpLjEsNuHgw@mail.gmail.com>

On Fri, Dec 27, 2024 at 07:33:30PM +0100, Geert Uytterhoeven wrote:
>Hi Sasha,
>
>On Fri, Dec 27, 2024 at 5:19 PM Sasha Levin <sashal@kernel.org> wrote:
>> No, it's not a problem. In my mind, I figured we could use shorter
>> hashes in mail message to make it easier to communicate.
>>
>> It doesn't have to be formal, but for example if we exchange mails about
>> an issue, and I end up referring to '1d1a ("arm64/sme: ...")' it both
>> makes the mail more readable, but still someone who doesn't have context
>> can still easily get to the commit I was referring to.
>
>Is that 1d1a commit something in your local tree? I don't seem to have it.

Heh, yeah, I wanted to pick a random commit with a longer subject line
and ended up landing on something local...

1d1a ("Merge tag 'mlx5-updates-2018-02-23' ...") works just as well :)

>A few other comments:
>  1. Please add support for --help. It took me a while to find out I
>     need to call the script without parameters to get the help.

Ack

>  2. The passed commit-subject needs to be the full commit subject.
>     It would be nice to support abbreviations, too.

It does it with ellipsis (I picked it up from sfr).

$ ./git-disambiguate.sh 1d1ab1ae6970 '("Merge tag 'mlx5-updates-2018-02-23' of git://git.kernel.org/pub/scm/linux/kernel/git/mellanox/linux into k.o/wip/dl-for-next")'
1d1ab1ae69701d813993af40cf3ee39781ec4d6f

$ ./git-disambiguate.sh 1d1a '("Merge tag...")'
1d1ab1ae69701d813993af40cf3ee39781ec4d6f

Which was what I was trying to show off in the example above :)

>BTW, I am a heavy user of looking up commits (recent and old ;-)
>My .vimrc has:
>
>    noremap ;gs "zyiw:exe "new \| setlocal buftype=nofile
>bufhidden=hide noswapfile syntax=git \| 0r ! git show ".@z."" \|
>:0<CR><CR>
>
>So I can move the cursor to a git commit ID, and type ";gs" to open
>the commit in a throw-away split window.
>Adding full support for commit-subjects may be challenging, especially
>if they are split across multiple lines (i.e. not Fixes: tags, but
>mentioned in the description).

Hyperlink git commits, eh? :)

-- 
Thanks,
Sasha
