Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079511AA1D2;
	Mon, 27 Apr 2026 13:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777295119; cv=none; b=d0p2Rti4fXPzYH7QUnhumMK0ajcgnCssu9UyRtUhhFdZrWMNJVHL9//qRpJV0FiVDAq9s3KC7M/lffaQ5rtLocJ6fVXIN57B6lCQzbvU/n4cghDecwtNp8HueFhKkuNpW7v/ILB5ysaQstyrtNHmd5O3ymAwXm2ZznKBH3eRNME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777295119; c=relaxed/simple;
	bh=Lza41XMlgAORgTPrOIxx0mVfW7vjfttcam+RAcvjn9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rYNLSK6B3yLfkadHgIje4a5lKOHDHtS0hhHAVhxScdSEau9dIV7qjbL62zwba6TvRDxt1WnmkIa/akVlPqNa1yunXzG1OYLMdoeNO26rFJ0veNIT5dEjVfPhzTiWNItsuLkL8RULlZVasFW6a3Gmg5c3tqmn7pchqGFAtU8RigA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oyQ42UYK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oyQ42UYK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3736C2BCB4;
	Mon, 27 Apr 2026 13:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777295118;
	bh=Lza41XMlgAORgTPrOIxx0mVfW7vjfttcam+RAcvjn9Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oyQ42UYK+wc4DTgrP5KucNJkM8LJkCpiocvs6+K2rvScnSoSLgwPDltTjJLy0S47u
	 Cuju+LoaIUnsNa+otM4IDuE69/NDK6OrTHKkE9InTm66ySgQyTwJbRwIoZ5BeZ3ZQM
	 8niiFZ7o/WlAjMgMJmCr0oV0KQgHUJ3SmMJkGQ31rSzWD8Vt2sZJ7WnnDtpdktc+Ui
	 YVG06+iOSQjMW8ViqkoMtoWRJapf7HhAJGOyDmwv5QhLraeMRYDP9pteBWqn8EOJic
	 UdFrvk7HqcAJFjLLPyshwtSK02PIyy2FA0Q7HB6GcT9Rm7Y3XTw1pmvNQzkO0J8a+W
	 kwnBpvjNWY10w==
Received: from localhost ([::1])
	by mail.kernel.org with esmtp (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wHLeG-0000000Bxxi-44yE;
	Mon, 27 Apr 2026 15:05:17 +0200
Date: Mon, 27 Apr 2026 15:05:15 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, workflows@vger.kernel.org, Alexandre Ghiti
 <alex@ghiti.fr>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Dan Williams <djbw@kernel.org>
Subject: Re: [PATCH v3 00/12] Auto-generate maintainer profile entries
Message-ID: <20260427150515.3ab3d3c4@localhost>
In-Reply-To: <cover.1777294623.git.mchehab+huawei@kernel.org>
References: <cover.1777294623.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 27 Apr 2026 15:00:00 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Hi Jon,
> 
> This is basically the same patch series I sent during the merge
> window, rebased on the top of post 7.1-rc1 docs-next branch.
> It is tested both with and without O=DOCS.

Please ignore it...

> Mauro Carvalho Chehab (12):
>   MAINTAINERS: add an entry for media maintainers profile
>   MAINTAINERS: add maintainer-tip.rst to X86

... I forgot to drop those two. They aren't needed anymore.
Will resend it soon enough.

-- 
Thanks,
Mauro
