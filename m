Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2561023A0F5;
	Mon, 13 Jan 2025 14:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736779866; cv=none; b=qb536lrh6ar/2wKZWfQm6h+EN5tL1Lgb2o9634ttv5LQv/VNL3CIJfUOFziyFS6QNl6quCiHDVPTBY06zoPKEEKQRy7gU2Z7GoXzyTFZDu7miWxYF8TEyhtf+1vNGWXGX4kbwZdIEFcE4+ZFa/E8z51a3gKqfSrUCGYO1wWw09U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736779866; c=relaxed/simple;
	bh=z1ZXZIx/z4V5KmNpppQT5YoVYk/9fQs4q8arZzj0uns=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D7N5i6dPZ2NtgNFxLXqhihACrwAr8CsImcOKTjW3UNCVNIny9g/P4nkYjhC33xF4zUfkhlk+CR8VE42YMT0mcUbi5ek7yfCGvA4jkCKFq09oo+Mw3ndrYvTpHsQynnZBvSa7+izv4pN2Z4/37KfR/Cpt+ZRAMis+/zDaJHQZyzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1C02C4CED6;
	Mon, 13 Jan 2025 14:51:03 +0000 (UTC)
Date: Mon, 13 Jan 2025 09:51:01 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jacob Keller <jacob.e.keller@intel.com>, Yeking@red54.com,
 kuba@kernel.org, Jonathan Corbet <corbet@lwn.net>, "Theodore Ts'o"
 <tytso@mit.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy
 Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, Dwaipayan Ray
 <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Andrew
 Morton <akpm@linux-foundation.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 tech-board-discuss@lists.linux.dev
Subject: Re: [PATCH] Add short author date to Fixes tag
Message-ID: <20250113095101.4e0fff91@gandalf.local.home>
In-Reply-To: <CAMuHMdU095ySTFJEs7bvX8kN2kBcnnUkec3hbUxUbJBGf8B=pA@mail.gmail.com>
References: <tencent_6CF6E720909156A227D23AE8CFE4F9BA5D05@qq.com>
	<tencent_F8CFC8ED723F6E8103B4AF3D98D63D7F1F08@qq.com>
	<20250110080331.04645768@gandalf.local.home>
	<52541f79-ba1c-49c9-a576-45c3472d1c79@intel.com>
	<20250111120935.769ab9a3@gandalf.local.home>
	<CAMuHMdU095ySTFJEs7bvX8kN2kBcnnUkec3hbUxUbJBGf8B=pA@mail.gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 12 Jan 2025 11:54:21 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> FTR, while I do not support adding dates to Fixes-tags, I would just
> need to make a small modification to my fixes alias:
> 
> $ git help fixes
> 'fixes' is aliased to 'show --format='Fixes: %h ("%s")' -s'

Hmm, I've just been manually adding the Fixes tags ;-) That's because when
I add a fixes tag, I also do a more in depth analysis to make sure the
commit being tagged is really the cause of the problem. A lot of my fixes
tags are due to very subtle bugs, and a lot of times its a combination of
event that happened.


That said, maybe one day I'll use a script or alias in the future.

-- Steve
