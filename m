Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4555A282F0E;
	Wed, 15 Apr 2026 00:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776213460; cv=none; b=GrrjCOtYjLikEc4A9j3W87AlB3jbNjmUznbRDG4tMnKmEO0Gw1KBriD7ZJUaaGjgy3JZgIqoBI57rErWpvf9Mq8uNWpGcA9rKfc1DX8HT8S8gipe+bR71+xYXKXltpKUBrwxSKzXcTt35yl3hismFGyuGW5AU8zosQ8zeBITcYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776213460; c=relaxed/simple;
	bh=U3uVEzYmkWQQl56lgej8tIDa5/TAi7UzWlVbKP/XBok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oZytaULGRuAkRhXEnpK2jwOv2beYmobEQQuUH/ZVpf1hVqqigtshEy7vWSFZLXp1ZBTdHOBVmW/9xF6kqOVo35OR8Kq9xVnYRWjowORC3xyOuf7bcy1LDE8/96JNPaSVbvQsoIFrLWnRIvp6ZZRcaPHaSVAaRUC8ewD8uzwbX9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Wpl+oGTw; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Wpl+oGTw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=NWk1OBFGq7fCMOn4hgJFAPz3Phlc2ekQH0TpQuYeZNA=; b=Wpl+oGTw6CKo+sskcfHGzk4buU
	kUOmJX59gQBYcnRV+Ba7xESwMCaygY21twjB2S54xM4pIOROSFrrXGN7eZYEacqprcTCGL76ChPGQ
	THugEUQHj+eyps8eEV1IYhGSdDYPo+B6SJQ3/rZxoieiWVyQHcabrVRhNyth7164Ikel/AamAd0zH
	2ofSkUR47zE+Z57LsvT766HlurMvVe4hEUgUpcGinrtz4KCX+tDWncnqiofrkw5E9Uaqv8NKY6lrO
	Mmr0ynU/Kp3K6ZW3rly3kpG3AtmbVVy4+rcOQIBG/Pg8L//bejOTcm/a6/7+lLLpAWbwOXKRwn8kt
	GCLNge2Q==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCoG9-00000000Ntv-36BF;
	Wed, 15 Apr 2026 00:37:37 +0000
Message-ID: <1e22f13c-01c3-4fd4-8e8e-1c5ef40c27ed@infradead.org>
Date: Tue, 14 Apr 2026 17:37:37 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/4] MAINTAINERS: add an entry for media maintainers
 profile
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 workflows@vger.kernel.org, Dan Williams <djbw@kernel.org>
References: <cover.1776176108.git.mchehab+huawei@kernel.org>
 <5af4aa6a716228eea4d59dc26b97d642e1e7d419.1776176108.git.mchehab+huawei@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <5af4aa6a716228eea4d59dc26b97d642e1e7d419.1776176108.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/14/26 7:29 AM, Mauro Carvalho Chehab wrote:
> While media has a maintainers entry profile, its entry is
> missing at MAINTAINERS.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f0b106a4dd96..620219e48f98 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16115,6 +16115,7 @@ S:	Maintained
>  W:	https://linuxtv.org
>  Q:	http://patchwork.kernel.org/project/linux-media/list/
>  T:	git git://linuxtv.org/media.git
> +P:	Documentation/driver-api/media/maintainer-entry-profile.rst
>  F:	Documentation/admin-guide/media/
>  F:	Documentation/devicetree/bindings/media/
>  F:	Documentation/driver-api/media/

-- 
~Randy
