Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E0C82899;
	Sat, 11 Jan 2025 17:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736615279; cv=none; b=aakvd1x2mwjffOS1fHsdYTUiHM+pGWDlRyF6QiSVOaCCjHkCaIlxUyv5aXqV0nbbASPvK0bS/IQrUfW+AE1svWvg5X9qIKabZvXfoZRt+eZv8kggcPs6/VO3dxwQmX+DJ5T437iVT2xYey58bmsOUL4vBvNf23lkJlhdHNCVSwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736615279; c=relaxed/simple;
	bh=SJ708UIPDH6Cav15Wrw4sB7zhS7ivQqVfme3X1x9qb0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YxMGrxGnvT2QkstG4LHuQO67RfLNwGg9at4aD1lqoY17yutFP97uidfoMzhWHHPxoTgR5h3Pnkg7fTJkg88PsM6jbASL6FNYuzi8k/M33bzj19Ks+6oo/gUG1xx8b7HmhLoOCmbnZ8GUEDn2nVxGepuqkjsEz1k/EhVUrxQdxSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E423C4CED2;
	Sat, 11 Jan 2025 17:07:57 +0000 (UTC)
Date: Sat, 11 Jan 2025 12:09:35 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: <Yeking@Red54.com>, <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Theodore Ts'o <tytso@mit.edu>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Andy Whitcroft" <apw@canonical.com>, Joe
 Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas
 Bulwahn <lukas.bulwahn@gmail.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, <workflows@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <tech-board-discuss@lists.linux.dev>
Subject: Re: [PATCH] Add short author date to Fixes tag
Message-ID: <20250111120935.769ab9a3@gandalf.local.home>
In-Reply-To: <52541f79-ba1c-49c9-a576-45c3472d1c79@intel.com>
References: <tencent_6CF6E720909156A227D23AE8CFE4F9BA5D05@qq.com>
	<tencent_F8CFC8ED723F6E8103B4AF3D98D63D7F1F08@qq.com>
	<20250110080331.04645768@gandalf.local.home>
	<52541f79-ba1c-49c9-a576-45c3472d1c79@intel.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 10 Jan 2025 16:21:35 -0800
Jacob Keller <jacob.e.keller@intel.com> wrote:

> I personally find the date helpful as it can help place a commit without
> needing to take the extra time to do a lookup.

I've never found dates to be meaningful. I'm always more concerned about
when a commit was added to mainline. Thus the version where the commit was
added is very important for me. This is why I keep a bare clone of Linus's
tree and commonly do:

 $ git describe --contains fd3040b9394c
v5.19-rc1~159^2~154^2
 $ git describe --contains a76053707dbf
v5.15-rc1~157^2~376^2~4

I can easily see that a76053707dbf was added in 5.15 and fd3040b9394c was
added in 5.19. The amount of work needed to add dates to Fixes tags would
greatly exceed the amount of added work someone would need to do to do the
above operations if they wanted to know the order of commits.

-- Steve
