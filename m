Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9140615ECCC
	for <workflows@vger.kernel.org>; Sun, 25 Jan 2026 14:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769352687; cv=pass; b=uvBnKkET4dGQdn7sx+3VZkUdIkAGt9nYz6DuKDBmhU+OCk0NV3PU7EWQIP1sviy7rEvG0gwIRoWxCOq74D0Db/tqL+ruBRFB3Y/NVWwrZ2sGXg2STrCOrICwv2xcJx3aSLpVxPZtxtsUchQ9cP3JvbdLY9/kv3sI2Q0sS86JDqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769352687; c=relaxed/simple;
	bh=SZZ5KJFMykGYdGFWDrZsTwYCyWYm5jOchGVm19FF268=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=rTNFWXlCk2zYZy2wwhbgj0TyGCcjA4rZavoAXJ5WrOKVVbpTNVyz0fBfSScIWR49q27NMy1NpUZ2tajiTNDN/PxFTenSN2+9nOQobfWwrqtOGagX9FLnN7FWbSvYFR/5kznMApVguJheHplY6UKPFB3vjNjMMr+fIExGw9/pErw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxgwm8m+; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxgwm8m+"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4801d24d91bso39566505e9.2
        for <workflows@vger.kernel.org>; Sun, 25 Jan 2026 06:51:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769352685; cv=none;
        d=google.com; s=arc-20240605;
        b=YN0QkGeNW6Oub6yf65JpqZKUqU41Iih1JdnhLoxqFtCE3mC80vT+xlBrzEm3+kUZHW
         Sa7NFcq5C+8t50kQs/Te9ES9uesn8l0N7xi2TYPNvA+10tDdJmshIZ3CVZv9L1IfccR5
         z3dRtLMtZ0zqGt58C/CbdgvwXCkx+2LvyNkF3CkmYQ3HqxGOwcjYYqUKn+i7OaTdx6/y
         aiuMRcfVl6jy8wZpIBpxtEGfwCsJeQxeHMaTOeFJkqNWaFGxD5pUkUxYMXLWNSq69z02
         rhYOCAKNFX3oHHGqChKsDLeZBDrqZb3DDMFVWMwnuRH+8mg8IkcDGegkxz+uD/nY15T3
         GwKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=SZZ5KJFMykGYdGFWDrZsTwYCyWYm5jOchGVm19FF268=;
        fh=5CaWCRLMfcO3E+TwotIeG+BmyIbBdW9ENZ3gjLKzPzM=;
        b=kJqwYmvfSZxKjABlW3dYXcHcuv3LoeAlnrY/0W3g80iajIEnkw+yInt0wPnbjfVSOi
         IvDqsfzOPr8xNEMkHz4esAhj7wljW4skU9+KTk7oMHLHDVX5lf13aQGYufzsZD9eu94X
         bec1Gti6Tv8JKwJXAbw6J4L821aq9Krsz5WAB2b7oDtVLAON/C3Db8qbSf5HAbYKede8
         oEqlRRf+GB2FS61YlKyNfuWTEovXFsq/n8uOE7eUqg6meQf4xbwp6SY8z31CO5NM8TkW
         dg+fWZwBtgM5D/E3JRQqn2ejiaoNnYRvPI2vR7MwoYaYacIBKNKT6X126KctwC2+PoK9
         xAcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769352685; x=1769957485; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SZZ5KJFMykGYdGFWDrZsTwYCyWYm5jOchGVm19FF268=;
        b=cxgwm8m+ZJQ2BtyAAipNL2pU5Fr1gbADX7sHWQn3M6H1KySKZnkeRqMC12FjhGZPG6
         pvC3gcNGwiDPwyh7HAvJxUYD81mXua2pj/WNlmnqCOenBaLOLAkmiFmieV400s9xVgp4
         J5mdXacc75ihxX76Ii3H5SD0q4ougXu09b0EDAH34RHNcdgxtUcNXkL6jzidc3yQ1B99
         zr2tdFRpmMg6VMUh4ctBviOffOSc5DuYCdZSLoapaZbztn/UxV95cCPR75T978nVi8pD
         hLHzqctwyx1AJbVn6CHC0HDpdwGJxXsBgFf8ZovO2fhOCuYEu62gh7pXADfhYwBT2E6C
         01tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769352685; x=1769957485;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SZZ5KJFMykGYdGFWDrZsTwYCyWYm5jOchGVm19FF268=;
        b=VTdpsO0gpCVK0s1D3JS78tkiX49hgEB36znV4uPREl0RmVgt8F28ik0d4zyPuobklC
         kj+tLmiQkTW6K7CsiwgWQFzXgJOvMNHE3qweoB2pSX1dDJUTpAwVeXNjOqmoI0rrAdqA
         iUxNJWUsh2azzLeojK2ty8RS1zD0kUhOa6FXhfJHfmTtvSSdPFk683BalVSFcMfLnDpr
         EvUfWhdrRAfSa4zyM1Y7VVAGxAjWPoKuQgQUWMA2GUOwpKf5sQuoMVbe2qS36FWIAxiU
         mmCDeKDSNt/l+QEs1tWxXHZPHO8hVWHHOHh8jFBihMJl7xiRN4nAXWpvFQuyGDSa13bC
         1ODw==
X-Gm-Message-State: AOJu0YyfdN4VFNHLWZ67MyXEK/i39yn64g8nGuQEdmCbTb3KprtlEl+L
	t5oE0cTNR8nJdlCrsoH6uJ9YoBbIu9+tyZ7pG8yWgWzgH+g72WWRQWcKp8tXroeAPW4VlZh0uWa
	tCgFWsQENkC5B6MTgO8dTbEncFMz/mg1BsfUgzlQ=
X-Gm-Gg: AZuq6aL5kUFoTMDp/XoZb75qgBucnDz2shohpjIEsvKTqgA7DEp6oEYAe51Whe94zou
	S9j41jWCFE3Y3rIioAKK11wLqnacv2leyTZhRJGaJje/HPn10CoZrQ0QgcGVNzj0ztOWEQK7+ig
	mTWq3cR8/EU0WLNDtYK25vHNmklapqjEwYK5G8jYf/TC02xFLitcWpJkYTPJm05qYQFyhsDTlCq
	yHeGvLMNcaYPtT5+A7p6zq0+Me9QZZjyJEQB4d73K1hLuDZFuVd2E1dqt6Vt9L7WEOpoSNewG6c
	OFQXdtNkm7FKyrnN9ZE4sVSaDT4P7mxPnMOX8dk2nYCW22T2pnx5nzSBRA==
X-Received: by 2002:a05:600c:620f:b0:476:4efc:8ed4 with SMTP id
 5b1f17b1804b1-4805ce4e4e0mr28495065e9.11.1769352684518; Sun, 25 Jan 2026
 06:51:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: john ashrith6 <johnashrith6@gmail.com>
Date: Sun, 25 Jan 2026 20:21:14 +0530
X-Gm-Features: AZwV_QjoXML2HHu52yvbzqau6LTswwbhMRy0aDi-ka4UT-KavkL5Eut6wcwcOK4
Message-ID: <CABoKZAAgzFdYVnKLCyU18z4JMkJDH9K1dz0LLvr3iVxhiVYXaw@mail.gmail.com>
Subject: [PATCH v2] docs: clarify CC list guidance wording
To: workflows@vger.kernel.org
Cc: gregkh@linuxfoundation.org, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Updated the author and Signed-off-by to use my real name and removed
the patch header duplication from the email body.

Thanks for the feedback.
