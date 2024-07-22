Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F53916DEDA;
	Mon, 22 Jul 2024 15:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721661901; cv=none; b=Aa97h+gXwy7+Gn1BJ+6ABsEdZabnsQLyycXII1GZheBIburAPn16475xjawG5frNpXZIQTRQcg7j2SeK9wwXPjRi9nU89bmCxnuAyogSlB8jty1sBDF6YSq5c9qaM0FShkI/TYQGdMzTujpnaU2k5jBMWFe+fgaijT/PESGOINE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721661901; c=relaxed/simple;
	bh=8zr8aJusIKjq1c3Yq21mD14XAozGTnCpe2+gg4+iDKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AB46H6gbXvU+AjPa3Yb9ObDKoQzpKRXXT3ZbN8K9lMF/+ZmDH0pipQ9WUH96DyBwKbPQkNZCigb3j/x1hLTJ6OJgQj6ClCLXYh05/Gn7iXaKFrS8fw8WRyaJkK/npz8xcNNKdFZBDXsBkMDBJ/BGTA2k30HP7yRiNvY+U45pthQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=XhwVsjpX; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XhwVsjpX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=JJJApbRmtktqJc+0w8peDfX0HfoBVe+zuGkewnxbDuU=; b=XhwVsjpXph8FBdCu4Xs7D3JqVB
	f7CooCYLcvDmexAoScpNrssYxIc8WkvVzlF3oh3ajOECq6UdJj8a3ExgM60Ylc2LU9SezRGpRHfRM
	eBCuZurnVfgfwOzubAWDvf7iAljjGFHKWJW2o3mDAbYbPusgQG5qU8SMz9qs1tXlvmk3eKGXBodpA
	7i23dCWTHSL+QxL21FFtSwmwOJQkGkR7R2HzjNDpI2hsFCiYdig9JduoZsnSQKsSCQBlXdHW+cFCj
	oXIa3cZcevwOZ6qfrILDVxDWXOSmo/jRCYE1FJ8yOibqbZ4HdSFRv7mClhLV6xxPAQtoKmO0xPTbH
	+JXtIv0A==;
Received: from [50.53.4.147] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVuuJ-00000009w9e-2ius;
	Mon, 22 Jul 2024 15:24:59 +0000
Message-ID: <6f1f7e37-c5a3-4da8-9c03-6ef469ad90ac@infradead.org>
Date: Mon, 22 Jul 2024 08:24:57 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add Documentation/dev-tools/ to workflows@
To: Jakub Kicinski <kuba@kernel.org>, corbet@lwn.net
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org
References: <20240722142913.1709594-1-kuba@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240722142913.1709594-1-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/22/24 7:29 AM, Jakub Kicinski wrote:
> The goal of the workloads@ mailing list was to make it easier for

                  workflows@
as in $Subject.

> maintainers who don't use lore+lei to subscribe to topics related
> to process changes. In other words it should cover changes to Documentation
> files which most maintainers should know about. Recent changes from Kees [1]
> to provide guidelines on naming KUnit files did not fall under workflows@
> since Documentation/dev-tools/ isn't covered. The patch volume for
> dev-tools isn't huge and most of the changes are interesting. Add it.
> 
> Link: https://lore.kernel.org/20240720165441.it.320-kees@kernel.org/ # [1]
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ec6904cbfd1f..a85234de4fd0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6680,6 +6680,7 @@ DOCUMENTATION PROCESS
>  M:	Jonathan Corbet <corbet@lwn.net>
>  L:	workflows@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/dev-tools/
>  F:	Documentation/maintainer/
>  F:	Documentation/process/
>  

-- 
~Randy
