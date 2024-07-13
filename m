Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A1F44C7B;
	Sat, 13 Jul 2024 23:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720913354; cv=none; b=BTJjIisMK4xrwB+T3LYvMycvSKDiHXwoKqd6dbK701iofgrEKkw6/4jjaxeWVmqDFxlmDtQTqFH9iDOq8OYX2FsxYBpGT1srgvXfkkj7Utn0w3Vyj6tuB1CRb4A4ltx3x0ehTDY/PhUwY6BGsQrRj+1wrA2vfYyC/d91g1eFLhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720913354; c=relaxed/simple;
	bh=9YsAbIlpdz/tuyrdaEXBXa6p9dTowDSrz88F4VMwlIE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e89Gn1hbfi0GXMNM9kn3XayZK1MpkNc8EL32UXVoAJNgngcpsBZBZNxOGoq6sarZTDKLVn4CKrRk13kzThfiUl+O60xDbXUskXKDQM/oAXJAC5GyEwE0YqVmpH/U1lDWfVkeJ4+4uGS9KGv5c3KPDmWM3YnKR353nbbMpCsQ8t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hbNbQ1Ih; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hbNbQ1Ih"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33F55C32781;
	Sat, 13 Jul 2024 23:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720913353;
	bh=9YsAbIlpdz/tuyrdaEXBXa6p9dTowDSrz88F4VMwlIE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hbNbQ1IhwYDcVCgvy81O1+XK/9W2BkrXtx49AjtE1qQGaxm+d+m7QMpOxbsKE5pIC
	 VlN04WdYzEjB1A939FWeou3FpFSnx3/GK6QISL6XmjiPkdYvWHVmPwQjvYZkx6vfzI
	 0PEpcj0DJpBbqCUwYtGI37qY+MTrbp9xgEOXTZrSuaTHBwW/fUT0GyiRiquMu4+0tz
	 DyuVRcgDlhtW1gvDXOd4phpcFbeB3BMaQWbb1kWhJHv75a+X9+goI7GzRCZVh8I9aR
	 rBXaOA6DQznl7Wqg1Dxc3UZrIwtJenEhVZSRrrmbQvFjyNSqFaua81q6MvF1QAb6Ba
	 Wua6pyL57gmIw==
Date: Sat, 13 Jul 2024 16:29:11 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dan Williams
 <dan.j.williams@intel.com>, corbet@lwn.net, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: maintainer: discourage taking conversations
 off-list
Message-ID: <20240713162911.3973696a@kernel.org>
In-Reply-To: <20240713180725.32972358@foz.lan>
References: <20240712144903.392284-1-kuba@kernel.org>
	<669179424b589_1a77429479@dwillia2-xfh.jf.intel.com.notmuch>
	<20240712170558.50c89238@kernel.org>
	<20240713101328.72734cb0@foz.lan>
	<20240713141956.GH10946@pendragon.ideasonboard.com>
	<20240713180725.32972358@foz.lan>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 13 Jul 2024 18:07:25 +0200 Mauro Carvalho Chehab wrote:
> That's basically what I said: such things happen top/down and not at
> developer/maintainer level. Sure having it documented somewhere, on
> some document that management would actually read can be useful on
> discussions, specially when companies hire a third party company to
> help with their upstream process.
> 
> The point is: a developer-focused document - or even a submission
> document process won't affect how companies do their inner source

It's not a developer-focused document, Mauro.
I said that the document should *ALSO*, not exclusively inform
contributors that delay tactics and dismissing external contributors 
is not okay in Linux.

> development: companies that have internally heavy development teams
> will basically keep running their own internal development cycle,
> being concerned about upstream only when their product managers
> authorize them to publicly disclosure patches.
> 
> If the goal is to create a management awareness about how to better
> cope with upstream, then my suggestion is to write a new document
> from scratch [1] focusing specifically on that, containing a list of
> best practices with focus on orienting management inside companies 
> about how to deal with developers and maintainers working on
> upstream.
> 
> [1] there is a document there already that seems to be focused at
>     management style, but it doesn't cover any best practices
>     with regards to innersource/upstream:
> 
> 	Documentation/process/management-style.rst

Like multiple members of the TAB I did have a stab at rewriting
management style at some point. It's not easy. Don't let perfect 
be the enemy of good.
