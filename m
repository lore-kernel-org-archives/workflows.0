Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AC72222AC;
	Sun, 12 Jul 2026 14:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783867196; cv=none; b=E2TsBLs2ZnpgeQ3SAVDle3T3GFCG+m/+zsykgbSWFv+8ovDE374vpc9TnFR72/DK08DTDDWuUyhI3jFKooDqIoqgo9TVlMOD5Rm39VqTIAU0GkzVk66KRBEEcw+AqXG2118y4kWqj1YPt0YDOA1o/uCMA6jtEZ4kwIFVk0oUEGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783867196; c=relaxed/simple;
	bh=7LLevdbNxaU0PhwQau61zsMUlGEYAxbAyWs427wwNsM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SiXzGy94djNxzz0uW74flfZ0OlNNEl7jZzmMh45ofVtCfjRLqXjQ7GOBJ9/RJFVV+Qd8MKvCg9vVsxoRXK92ZrenBsdaGLwaUdIoSTxhVbldDgCqD8JoRMADSRmtgWG2H4xsha3/CLjwN0ZdJfyvc3IEVTXGCMqVKhtQaAbYZdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vqdi2WVs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vqdi2WVs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BC031F000E9;
	Sun, 12 Jul 2026 14:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783867195;
	bh=dbJBZVax2+gXi5VfLNHSCmBmyIOoE+2Ee88yMJ8KZkU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Vqdi2WVsynwixNKwUltpBbeOGXiUHzEjbVfrmI3il9Up5QvMW/aWBmkHlDw98A9s6
	 D458k41sXGn0mKwuOzxmn0F71oVaXwb44x4uzLJaEJMEE8bmoy7JuD3oSPoWKB6DqA
	 q42QIWnXcZY5/sT1knYQ1mDCUfI3WCyEryrY3PWPW39YcDjeZCZjn2quvPl01J2FgY
	 WanOLaUSEPF1ZP7wE6pN7BDA5hQY563u1gMEdJDDXFNIpGYM0xowJVMRwunBw/vlgz
	 MMjdJdd/TvINZWwoFDy1C0O32rglOFD/IjHlWfj2Cagb+8NvWqVeMAFo3As95C22EC
	 L48kM6OeU6q9w==
Date: Sun, 12 Jul 2026 16:39:51 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, workflows@vger.kernel.org
Subject: Re: [Issue] maintainer-handbooks: html: list has duplicates
Message-ID: <20260712163951.554aa998@foz.lan>
In-Reply-To: <20260712115900.481835-1-manuelebner@mailbox.org>
References: <98a558a87a07ab641f47c66c372ee7ed0735f4f5.camel@mailbox.org>
	<20260712115900.481835-1-manuelebner@mailbox.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 12 Jul 2026 13:58:59 +0200
Manuel Ebner <manuelebner@mailbox.org> wrote:

> There are only two patches which can cause that:
> 
> commit 8eae6da5f56c ("docs: auto-generate maintainer entry profile links")
> commit bda185c30593 ("docs: maintainers_include: Only show main entry for profiles")
> 
> Therefore adding Mauro to recipients.

That's weird: I'm pretty sure I tested it. Also, entries were supposed
to be sorted.

I'll work on a fixup patch. Thanks for reporting it!

Thanks,
Mauro
