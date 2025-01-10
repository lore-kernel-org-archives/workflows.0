Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CF7207A28;
	Fri, 10 Jan 2025 13:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736514119; cv=none; b=tMXw/Aa4plrTxKjDPk3YC4czc8/2+JMqQH4bSp5nC94QKCfwY+VVA6avmvTbzQjRXyM8G2k5HEfwYwWHxSlvpF6vprB4ej2c9WwXecwOjs1LVNF3VkWlGbXI9hdh9oAqOOLfPcb3kTTPitGLxQJKUNuwh5skfBcLOmMLwEi1MZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736514119; c=relaxed/simple;
	bh=FNlpoKb8PA9MNOmi+DP6+QjGuzgGi1Q7Ly+NxrO9LYE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gEJK+EvJ9dy+j6/Gl1KroMoabBXlHiqzH4HvP1fRL3YCJrsx05WLBTmsHgKdVWZaEfl2MaZpSlV2hjRI+PFoI8SL9TEDapmBlQZD8ONc/5/l0xBA63JnmsfKX//uX2VvDyvHwws5iAivvV6jTrCIbp1ZBkE3RoMz4TMYw9t/dDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD543C4CED6;
	Fri, 10 Jan 2025 13:01:55 +0000 (UTC)
Date: Fri, 10 Jan 2025 08:03:31 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Yeking@Red54.com
Cc: kuba@kernel.org, Jonathan Corbet <corbet@lwn.net>, "Theodore Ts'o"
 <tytso@mit.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy
 Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, Dwaipayan Ray
 <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Jacob
 Keller <jacob.e.keller@intel.com>, Andrew Morton
 <akpm@linux-foundation.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 tech-board-discuss@lists.linux.dev
Subject: Re: [PATCH] Add short author date to Fixes tag
Message-ID: <20250110080331.04645768@gandalf.local.home>
In-Reply-To: <tencent_F8CFC8ED723F6E8103B4AF3D98D63D7F1F08@qq.com>
References: <tencent_6CF6E720909156A227D23AE8CFE4F9BA5D05@qq.com>
	<tencent_F8CFC8ED723F6E8103B4AF3D98D63D7F1F08@qq.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 10 Jan 2025 12:20:09 +0000
Yeking@Red54.com wrote:

> The old Fixes tag style is at least 10 years old. It lacks date
> information, which can lead to misjudgment. So I added short author date
> to avoid this. This make it clear at a glance and reduce
> misunderstandings.

How can it lead to misjudgment? If you have two or more hashes matching, do
you really think they'll have the same subjects?

I do not plan on doing this. It's pointless.

-- Steve
