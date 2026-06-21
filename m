Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7700240D588;
	Sun, 21 Jun 2026 00:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782000562; cv=none; b=r/rvfBnbIuFOoEiVuebGUoiyBSLXn5zk6I1/HGFzUhtRmOvSk5csiUBXbali7o/WmEs7Air/OuRQN2dz+Lqp2PYLmZcvSFtxRuu6wWzNMBT8yBQ8R5ELz/3PgEr5GUk9Xigpa+TkvSW9lPkdcWo3UcZfoJvsvcmq7Lc3jcGCWJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782000562; c=relaxed/simple;
	bh=BQtv+qrlbu90yKB/ZVi9rqr+2sKlrkY7QG0vvvJ5MYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OXAHI2ic0msdn+p1IX+Zny77ZgXRw51PTaUx3mgKRBKnjdrp1qMdko3Vz0UqUvwCx1bDI7aP7Z2jrQOCWAthJR5gvZTXlQdYwQSELv+Ot2PMUSvFiDwxGD3xIo7wWnMxQavtgAZhK1mUJfUgIMfUyA1uwRaD3v+Uef63ooMHA6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=C9dX86HR; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="C9dX86HR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=JRDdqMNAqR4f0wNKFXhIHixi5hzX+BDrjwUKtKvJni0=; b=C9dX86HRAuDIr4foy4iKh59/jM
	JWy+6mpBo7gtthHZMjHwKwJDLCLuibSyENbj6+he233qQfGjFMVPdu3ahaa/VCbitf0ZthU7P0QHm
	uYWwjnWFOlECqYL1NTbdqywjqK7ZxxLh5fr3JRJtyPpOhSyMeiI9OCU/9pWgMr2uwoQtjphCu7jC1
	OO7UcwtmUGE9K1CFY3jVn/BYq8AAazhsuw6PanPS8hREsp3gMKYl9DmAEGh6CCKUnuYrHFbUIG9Tw
	qBY/T4pe68XxFD+1IKOmouvZTB5luGESqef6DgOw1WBXHSKFKrg+J+OXLAu+TcxYfAaNfXrHYNMvl
	4HHnb7Og==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb5kV-00000003eDz-21Au;
	Sun, 21 Jun 2026 00:09:19 +0000
Message-ID: <f23bdd14-359b-4533-b062-30d603116caa@infradead.org>
Date: Sat, 20 Jun 2026 17:09:18 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: kgdb: Fix path of driver options
To: Zenghui Yu <zenghui.yu@linux.dev>, kgdb-bugreport@lists.sourceforge.net,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: jason.wessel@windriver.com, danielt@kernel.org, dianders@chromium.org,
 corbet@lwn.net, skhan@linuxfoundation.org
References: <20260620234035.9917-1-zenghui.yu@linux.dev>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260620234035.9917-1-zenghui.yu@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/20/26 4:40 PM, Zenghui Yu wrote:
> The correct path of driver options should be
> /sys/module/<driver>/parameters/<option>. Fix it.
> 
> Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/process/debugging/kgdb.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/process/debugging/kgdb.rst b/Documentation/process/debugging/kgdb.rst
> index c4d0a9121d52..316b1d74e9c8 100644
> --- a/Documentation/process/debugging/kgdb.rst
> +++ b/Documentation/process/debugging/kgdb.rst
> @@ -513,7 +513,7 @@ unregister all the kernel hook points.
>  
>  All kgdb I/O drivers can be reconfigured at run time, if
>  ``CONFIG_SYSFS`` and ``CONFIG_MODULES`` are enabled, by echo'ing a new
> -config string to ``/sys/module/<driver>/parameter/<option>``. The driver
> +config string to ``/sys/module/<driver>/parameters/<option>``. The driver
>  can be unconfigured by passing an empty string. You cannot change the
>  configuration while the debugger is attached. Make sure to detach the
>  debugger with the ``detach`` command prior to trying to unconfigure a

-- 
~Randy
